use crate::dart_source_writer::{DartSourceWriter, ImportedUri};
use std::io::{self, Write};

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct Enum {
    documentation: Option<String>,
    name: String,
    fields: Vec<EnumField>,
}

impl Enum {
    pub(crate) fn new(
        name: String,
        documentation: Option<String>,
        fields: Vec<EnumField>,
    ) -> Self {
        Self {
            documentation,
            name,
            fields,
        }
    }
}

impl crate::Element for Enum {
    #[inline(always)]
    fn name(&self) -> &str { &self.name }

    #[inline(always)]
    fn documentation(&self) -> Option<&str> { self.documentation.as_deref() }

    fn generate_source(&self, w: &mut DartSourceWriter) -> io::Result<()> {
        let mut ffi = ImportedUri::new(String::from("package:ffi/ffi.dart"));
        ffi.with_prefix(String::from("ffi"));
        w.import(ffi);
        writeln!(w)?;
        if let Some(ref docs) = self.documentation {
            let docs = docs
                .split('\n')
                .map(|c| format!("/// {}", c))
                .collect::<Vec<_>>()
                .join("\n");
            writeln!(w, "{}", docs)?;
        } else {
            writeln!(w, "/// C enum `{}`.", self.name)?;
        }
        writeln!(w, "abstract class {} {{", self.name)?;

        for EnumField { name, value } in &self.fields {
            writeln!(w, "  static const int {} = {};", name, value)?;
        }

        writeln!(w, "}}")?;
        Ok(())
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct EnumField {
    name: String,
    value: u64,
}

impl EnumField {
    pub(crate) const fn new(name: String, value: u64) -> Self {
        Self { name, value }
    }
}
