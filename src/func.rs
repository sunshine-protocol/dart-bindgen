use crate::dart_source_writer::DartSourceWriter;
use std::io::{self, Write};

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct Func {
    documentation: Option<String>,
    name: String,
    params: Vec<Param>,
    return_ty: String,
}

impl Func {
    pub(crate) fn new(
        name: String,
        documentation: Option<String>,
        params: Vec<Param>,
        return_ty: String,
    ) -> Self {
        Self {
            documentation,
            name,
            params,
            return_ty,
        }
    }
}

impl crate::Element for Func {
    #[inline(always)]
    fn name(&self) -> &str { &self.name }

    #[inline(always)]
    fn documentation(&self) -> Option<&str> { self.documentation.as_deref() }

    fn generate_source(&self, w: &mut DartSourceWriter) -> io::Result<()> {
        let typedef_c = format!("_{}_C", self.name);
        let typedef_dart = format!("_{}_Dart", self.name);
        writeln!(w)?;
        if let Some(ref docs) = self.documentation {
            let docs = docs
                .split('\n')
                .map(|c| format!("/// {}", c))
                .collect::<Vec<_>>()
                .join("\n");
            writeln!(w, "{}", docs)?;
        } else {
            writeln!(w, "/// C function `{}`.", self.name)?;
        }
        write!(w, "{} {}(", w.get_dart_type(&self.return_ty), self.name)?;

        if !self.params.is_empty() {
            writeln!(w)?;
        }

        for (i, param) in self.params.iter().enumerate() {
            writeln!(
                w,
                "  {} {},",
                w.get_dart_type(&param.ty),
                param.name.clone().unwrap_or_else(|| format!("arg{}", i))
            )?;
        }
        writeln!(w, ") {{")?;
        let param_names: Vec<_> = self
            .params
            .iter()
            .enumerate()
            .map(|(i, param)| {
                param.name.clone().unwrap_or_else(|| format!("arg{}", i))
            })
            .collect();
        if w.get_dart_type(&self.return_ty) != "void" {
            write!(w, "  return")?;
        } else {
            write!(w, " ")?;
        }
        write!(w, " _{}(", self.name)?;
        write!(w, "{}", param_names.join(", "))?;
        writeln!(w, ");")?;
        writeln!(w, "}}")?;
        write!(w, "final {} _{} = ", typedef_dart, self.name)?;

        writeln!(
            w,
            "_dl.lookupFunction<{}, {}>('{}');",
            typedef_c, typedef_dart, self.name
        )?;

        write!(
            w,
            "typedef {} = {} Function(",
            typedef_c,
            w.get_ctype(&self.return_ty)
        )?;

        if !self.params.is_empty() {
            writeln!(w)?;
        }

        for (i, param) in self.params.iter().enumerate() {
            writeln!(
                w,
                "  {} {},",
                w.get_ctype(&param.ty),
                param.name.clone().unwrap_or_else(|| format!("arg{}", i))
            )?;
        }
        writeln!(w, ");")?;
        write!(
            w,
            "typedef {} = {} Function(",
            typedef_dart,
            w.get_dart_type(&self.return_ty)
        )?;

        if !self.params.is_empty() {
            writeln!(w)?;
        }

        for (i, param) in self.params.iter().enumerate() {
            writeln!(
                w,
                "  {} {},",
                w.get_dart_type(&param.ty),
                param.name.clone().unwrap_or_else(|| format!("arg{}", i))
            )?;
        }
        writeln!(w, ");")?;

        Ok(())
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct Param {
    name: Option<String>,
    ty: String,
}

impl Param {
    pub(crate) const fn new(name: Option<String>, ty: String) -> Self {
        Self { name, ty }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::{dart_source_writer::ImportedUri, Element};
    macro_rules! get_dsw {
        () => {{
            let mut dsw = DartSourceWriter::new();
            dsw.import(ImportedUri::new(String::from("dart:ffi")));
            let mut ffi =
                ImportedUri::new(String::from("package:ffi/ffi.dart"));
            ffi.with_prefix(String::from("ffi"));
            dsw.import(ffi);
            dsw
        }};
    }
    #[test]
    fn test_func_void_with_no_params() {
        let mut dsw = get_dsw!();
        let func =
            Func::new("simple".to_owned(), None, Vec::new(), "void".to_owned());
        func.generate_source(&mut dsw).unwrap();
        // TODO invoce dart checker here.
        println!("{}", dsw.to_string());
    }

    #[test]
    fn test_func_void_with_params() {
        let mut dsw = get_dsw!();

        let func = Func::new(
            "simple2".to_owned(),
            None,
            vec![Param {
                name: Some("a".to_owned()),
                ty: "long".to_owned(),
            }],
            "void".to_owned(),
        );
        func.generate_source(&mut dsw).unwrap();
        println!("{}", dsw.to_string());
    }

    #[test]
    fn test_func_with_docs() {
        let mut dsw = get_dsw!();

        let func = Func::new(
            "simple3".to_owned(),
            Some("Comment".to_string()),
            vec![Param {
                name: Some("a".to_owned()),
                ty: "long".to_owned(),
            }],
            "void".to_owned(),
        );
        func.generate_source(&mut dsw).unwrap();
        println!("{}", dsw.to_string());
    }

    #[test]
    fn test_func_with_unnamed_args() {
        let mut dsw = get_dsw!();

        let func = Func::new(
            "simple4".to_owned(),
            None,
            vec![
                Param {
                    name: None,
                    ty: "long".to_owned(),
                },
                Param {
                    name: None,
                    ty: "long".to_owned(),
                },
            ],
            "void".to_owned(),
        );
        func.generate_source(&mut dsw).unwrap();
        println!("{}", dsw.to_string());
    }
}
