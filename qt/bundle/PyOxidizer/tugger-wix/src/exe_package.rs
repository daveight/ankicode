// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

use {
    crate::ChainElement,
    anyhow::Result,
    std::{borrow::Cow, io::Write},
    xml::writer::{EventWriter, XmlEvent},
};

/// Behavior for an exit code.
#[derive(Clone, Copy, Debug)]
pub enum Behavior {
    /// Interpret exit code as success.
    Success,

    /// Interpret exit code as error.
    Error,

    /// Schedule reboot.
    ScheduleReboot,

    /// Force an immediate reboot.
    ForceReboot,
}

impl ToString for Behavior {
    fn to_string(&self) -> String {
        match self {
            Self::Success => "success",
            Self::Error => "error",
            Self::ScheduleReboot => "scheduleReboot",
            Self::ForceReboot => "forceReboot",
        }
        .to_string()
    }
}

/// Defines a mapping of an exit code to behavior.
#[derive(Clone, Debug)]
pub struct ExitCode {
    /// What behavior to take.
    pub behavior: Behavior,

    /// The exit code value.
    pub value: i32,
}

/// Represents the `<ExePackage>` WiX XML element.
#[derive(Clone, Debug, Default)]
pub struct ExePackage<'a> {
    pub id: Option<Cow<'a, str>>,
    pub name: Option<Cow<'a, str>>,
    pub source_file: Option<Cow<'a, str>>,
    pub display_name: Option<Cow<'a, str>>,
    pub cache: Option<Cow<'a, str>>,
    pub compressed: Option<Cow<'a, str>>,
    pub per_machine: Option<Cow<'a, str>>,
    pub permanent: Option<Cow<'a, str>>,
    pub install_condition: Option<Cow<'a, str>>,
    pub detect_condition: Option<Cow<'a, str>>,
    pub install_command: Option<Cow<'a, str>>,
    pub repair_command: Option<Cow<'a, str>>,
    pub uninstall_command: Option<Cow<'a, str>>,
    pub exit_codes: Vec<ExitCode>,
}

impl<'a> From<ExePackage<'a>> for ChainElement<'a> {
    fn from(exe: ExePackage<'a>) -> Self {
        Self::ExePackage(Box::new(exe))
    }
}

impl<'a> ExePackage<'a> {
    pub fn write_xml<W: Write>(&self, writer: &mut EventWriter<W>) -> Result<()> {
        let e = XmlEvent::start_element("ExePackage");

        let e = if let Some(value) = &self.id {
            e.attr("Id", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.name {
            e.attr("Name", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.source_file {
            e.attr("SourceFile", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.display_name {
            e.attr("DisplayName", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.cache {
            e.attr("Cache", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.compressed {
            e.attr("Compressed", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.per_machine {
            e.attr("PerMachine", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.permanent {
            e.attr("Permanent", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.install_condition {
            e.attr("InstallCondition", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.detect_condition {
            e.attr("DetectCondition", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.install_command {
            e.attr("InstallCommand", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.repair_command {
            e.attr("RepairCommand", value)
        } else {
            e
        };

        let e = if let Some(value) = &self.uninstall_command {
            e.attr("UninstallCommand", value)
        } else {
            e
        };

        writer.write(e)?;

        for exit_code in &self.exit_codes {
            writer.write(
                XmlEvent::start_element("ExitCode")
                    .attr("Behavior", exit_code.behavior.to_string().as_str())
                    .attr("Value", format!("{}", exit_code.value).as_str()),
            )?;
            writer.write(XmlEvent::end_element().name("ExitCode"))?;
        }

        writer.write(XmlEvent::end_element().name("ExePackage"))?;

        Ok(())
    }
}
