// Copyright 2022 Gregory Szorc.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// https://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.

/*! Functionality for building a library containing Python */

use {
    crate::licensing::LicensedComponents,
    simple_file_manifest::FileData,
    std::{
        collections::{BTreeMap, BTreeSet},
        path::PathBuf,
    },
};

/// Holds state necessary to build and link a libpython.
///
/// Note that this context is only for producing libpython: it is very
/// linker centric and doesn't track state like Python resources.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct LibPythonBuildContext {
    /// Compiled flags to use when compiling the object containing Py_inittab.
    pub inittab_cflags: Option<Vec<String>>,

    /// Include files defining Python headers.
    ///
    /// These are necessary to compile code that references Python types.
    pub includes: BTreeMap<PathBuf, FileData>,

    /// Object files that will be linked together.
    pub object_files: Vec<FileData>,

    /// Filesystem paths to add to linker search path.
    pub library_search_paths: BTreeSet<PathBuf>,

    /// System libraries that will be linked against.
    pub system_libraries: BTreeSet<String>,

    /// Dynamic libraries that will be linked against.
    pub dynamic_libraries: BTreeSet<String>,

    /// Static libraries that will be linked against.
    pub static_libraries: BTreeSet<String>,

    /// Frameworks that will be linked against.
    ///
    /// Used on Apple platforms.
    pub frameworks: BTreeSet<String>,

    /// Builtin extension module initialization functions.
    ///
    /// Key is extension name. Value is initialization function. The
    /// function can have the special value `NULL`.
    pub init_functions: BTreeMap<String, String>,

    /// Holds licensing info for things being linked together.
    pub licensed_components: LicensedComponents,
}

impl LibPythonBuildContext {
    /// Merge multiple `LinkingContext` together to produce an aggregate instance.
    pub fn merge(contexts: &[&Self]) -> Self {
        let mut inittab_cflags = None;
        let mut includes = BTreeMap::new();
        let mut object_files = Vec::new();
        let mut library_search_paths = BTreeSet::new();
        let mut system_libraries = BTreeSet::new();
        let mut dynamic_libraries = BTreeSet::new();
        let mut static_libraries = BTreeSet::new();
        let mut frameworks = BTreeSet::new();
        let mut init_functions = BTreeMap::new();
        let mut licensed_components = LicensedComponents::default();

        for context in contexts {
            // Last write wins.
            if let Some(flags) = &context.inittab_cflags {
                inittab_cflags = Some(flags.clone());
            }
            for (k, v) in &context.includes {
                includes.insert(k.clone(), v.clone());
            }
            for o in &context.object_files {
                object_files.push(o.clone());
            }
            for p in &context.library_search_paths {
                library_search_paths.insert(p.clone());
            }
            for l in &context.system_libraries {
                system_libraries.insert(l.clone());
            }
            for l in &context.dynamic_libraries {
                dynamic_libraries.insert(l.clone());
            }
            for l in &context.static_libraries {
                static_libraries.insert(l.clone());
            }
            for f in &context.frameworks {
                frameworks.insert(f.clone());
            }
            for (k, v) in &context.init_functions {
                init_functions.insert(k.clone(), v.clone());
            }
            for c in context.licensed_components.iter_components() {
                licensed_components.add_component(c.clone());
            }
        }

        Self {
            inittab_cflags,
            includes,
            object_files,
            library_search_paths,
            system_libraries,
            dynamic_libraries,
            static_libraries,
            frameworks,
            init_functions,
            licensed_components,
        }
    }
}
