// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

use {
    crate::{common::extract_wix, *},
    anyhow::{anyhow, Context, Result},
    simple_file_manifest::{FileEntry, FileManifest},
    std::{
        collections::BTreeMap,
        path::{Path, PathBuf},
    },
    tugger_windows_codesign::{is_file_signable, SigntoolSign},
    xml::EmitterConfig,
};

/// Entity used to build installers using the WiX Toolkit.
pub struct WiXInstallerBuilder {
    /// Prefix to use in generated WiX IDs.
    ///
    /// This is also used to derive the GUID for autogenerated
    /// components. It should uniquely identify the application/installer.
    id_prefix: String,

    /// WiX architecture we are building for.
    arch: String,

    /// Files to install in primary install location.
    install_files: FileManifest,

    /// Path of `.wxs` that will contain fragments for `install_files.
    install_files_wxs_path: PathBuf,

    /// `<Directory Id=` value that the autogenerated wxs file will use for the root
    /// of `install_files`.
    install_files_root_directory_id: String,

    /// Directory to use for build state.
    build_path: PathBuf,

    /// Variables to define when running light.
    variables: BTreeMap<String, Option<String>>,

    /// wxs files defining the WiX installer.
    ///
    /// These files will be materialized and processed when building.
    wxs_files: BTreeMap<PathBuf, WxsBuilder>,

    /// Extra files to install in the build directory.
    extra_build_files: FileManifest,

    /// Signtool settings to use to auto sign binaries and the installer.
    auto_sign_signtool_settings: Option<SigntoolSign>,
}

impl WiXInstallerBuilder {
    /// Create a new instance.
    pub fn new<P: AsRef<Path>>(id_prefix: String, arch: String, build_path: P) -> Self {
        Self {
            id_prefix,
            arch,
            build_path: build_path.as_ref().to_path_buf(),
            install_files: FileManifest::default(),
            install_files_wxs_path: PathBuf::from("install-files.wxs"),
            install_files_root_directory_id: "APPLICATIONFOLDER".to_string(),
            variables: BTreeMap::new(),
            wxs_files: BTreeMap::new(),
            extra_build_files: FileManifest::default(),
            auto_sign_signtool_settings: None,
        }
    }

    /// The WiX architecture of the installer we're building.
    pub fn arch(&self) -> &str {
        &self.arch
    }

    /// Set the WiX architecture of the installer we're building.
    pub fn set_arch(&mut self, value: impl ToString) {
        self.arch = value.to_string();
    }

    /// Obtain variables that will be used for `light` invocations.
    pub fn variables(&self) -> std::collections::btree_map::Iter<String, Option<String>> {
        self.variables.iter()
    }

    /// Set a WiX variable with an optional value.
    ///
    /// These are passed to `light.exe`.
    pub fn set_variable<S: ToString>(&mut self, key: S, value: Option<S>) {
        self.variables
            .insert(key.to_string(), value.map(|x| x.to_string()));
    }

    /// Set the directory to use to build the installer in.
    pub fn set_build_path(&mut self, path: impl AsRef<Path>) {
        self.build_path = path.as_ref().to_path_buf();
    }

    /// Obtain the directory to use for building the installer.
    pub fn build_path(&self) -> &Path {
        &self.build_path
    }

    pub fn wxs_files(&self) -> &BTreeMap<PathBuf, WxsBuilder> {
        &self.wxs_files
    }

    /// Add a wxs file to build.
    pub fn add_wxs(&mut self, wxs: WxsBuilder) {
        self.wxs_files.insert(wxs.path().to_path_buf(), wxs);
    }

    /// Add an extra file to the build environment.
    ///
    /// These files will be materialized next to .wxs files.
    pub fn add_extra_build_file<P: AsRef<Path>>(
        &mut self,
        path: P,
        content: impl Into<FileEntry>,
    ) -> Result<()> {
        self.extra_build_files.add_file_entry(path, content)?;

        Ok(())
    }

    /// Add additional files to be materialized in the build environment.
    ///
    /// Files are specified via a `FileManifest` and will be materialized next
    /// to `.wxs` files.
    pub fn add_extra_build_files(&mut self, manifest: &FileManifest) -> Result<()> {
        self.extra_build_files.add_manifest(manifest)?;

        Ok(())
    }

    pub fn install_files(&self) -> &FileManifest {
        &self.install_files
    }

    pub fn install_files_mut(&mut self) -> &mut FileManifest {
        &mut self.install_files
    }

    /// The path that the auto-generated wxs file for [Self::install_files] will be materialized
    /// in.
    ///
    /// Default is `install-files.wxs`.
    pub fn install_files_wxs_path(&self) -> &Path {
        &self.install_files_wxs_path
    }

    /// Set the path that the auto-generated wxs file for [Self::install_files] will be
    /// materialized in.
    pub fn set_install_files_wxs_path(&mut self, path: impl AsRef<Path>) {
        self.install_files_wxs_path = path.as_ref().to_path_buf();
    }

    /// The `<Directory Id=` value that the autogenerated `<DirectoryRef>` for [Self::install_files]
    /// will refer to.
    ///
    /// This essentially defines how to map our autogenerated wxs file containing fragments
    /// for [Self::install_files] to an install location.
    ///
    /// The default value is `APPLICATIONFOLDER`. You may need to change this value
    /// if your `<Directory>` corresponding to the root installation directory has
    /// a different `Id` value.
    pub fn install_files_root_directory_id(&self) -> &str {
        &self.install_files_root_directory_id
    }

    /// Set the `<Directory Id=` that the root of [Self::install_files] will point to.
    ///
    /// See [Self::install_files_root_directory_id] for more on this functionality.
    pub fn set_install_files_root_directory_id(&mut self, value: impl ToString) {
        self.install_files_root_directory_id = value.to_string();
    }

    /// Register signtool signing settings to be used to automatically sign binaries.
    ///
    /// This will automatically sign all installed binaries as well as the
    /// generated installer.
    pub fn auto_sign_signtool(&mut self, settings: SigntoolSign) {
        self.auto_sign_signtool_settings = Some(settings);
    }

    fn stage_path(&self) -> PathBuf {
        self.build_path.join("staged_files")
    }

    /// Generate a wxs file containing fragments for all files registered for install.
    ///
    /// This will take the current [Self::install_files] manifest and produce a WiX XML
    /// file containing `<Fragment>` and `<DirectoryRef>` for the contents of that manifest.
    /// The WXS file will be registered for building.
    pub fn add_files_manifest_wxs(&mut self) -> Result<()> {
        let mut emitter_config = EmitterConfig::new();
        emitter_config.perform_indent = true;

        let buffer = Vec::new();
        let writer = std::io::BufWriter::new(buffer);
        let mut emitter = emitter_config.create_writer(writer);
        write_file_manifest_to_wix(
            &mut emitter,
            &self.install_files,
            &self.stage_path(),
            &self.install_files_root_directory_id,
            &self.id_prefix,
        )?;

        self.add_wxs(WxsBuilder::from_data(
            &self.install_files_wxs_path,
            emitter.into_inner().into_inner()?,
        ));

        Ok(())
    }

    /// Produce an installer using the configuration in this builder.
    ///
    /// The output could be an MSI, exe, or other file formats depending on what the
    /// wxs files define.
    pub fn build<P: AsRef<Path>>(&self, output_path: P) -> Result<()> {
        let wix_toolset_path = extract_wix(&self.build_path).context("extracting WiX Toolset")?;

        // Materialize FileManifest so we can reference files from WiX.
        let installed_files = self
            .install_files
            .materialize_files(&self.stage_path())
            .context("writing install files")?;

        // Automatically sign files that are signable.
        if let Some(signtool_settings) = &self.auto_sign_signtool_settings {
            for path in installed_files {
                if is_file_signable(&path)
                    .with_context(|| format!("checking if {} is signable", path.display()))?
                {
                    signtool_settings
                        .clone_settings()
                        .sign_file(&path)
                        .run()
                        .with_context(|| format!("signing {}", path.display()))?;
                }
            }
        }

        let wxs_path = self.build_path.join("wxs");

        self.extra_build_files
            .materialize_files(&wxs_path)
            .context("writing extra build files")?;

        let mut wixobj_paths = Vec::new();

        for (path, wxs) in &self.wxs_files {
            let dest_path = wxs_path.join(path);
            let parent = dest_path
                .parent()
                .ok_or_else(|| anyhow!("could not determine parent directory"))?;
            if !parent.exists() {
                std::fs::create_dir_all(parent)
                    .context("creating parent directory for wxs file")?;
            }

            std::fs::write(&dest_path, wxs.data()).context("writing wxs file")?;

            wixobj_paths.push(
                run_candle(
                    &wix_toolset_path,
                    &dest_path,
                    &self.arch,
                    wxs.preprocessor_parameters(),
                    None,
                )
                .context("running candle")?,
            );
        }

        run_light(
            &wix_toolset_path,
            &self.build_path,
            wixobj_paths.iter(),
            self.variables.iter().map(|(k, v)| (k.clone(), v.clone())),
            output_path.as_ref(),
        )
        .context("running light")?;

        if let Some(signtool_settings) = &self.auto_sign_signtool_settings {
            if is_file_signable(output_path.as_ref()).context("checking if file is signable")? {
                signtool_settings
                    .clone_settings()
                    .sign_file(output_path.as_ref())
                    .run()
                    .with_context(|| format!("signing {}", output_path.as_ref().display()))?;
            }
        }

        Ok(())
    }
}
