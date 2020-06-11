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

    // TODO(@shekohex): Split this into smaller functions for readabilty.
    fn generate_source(&self, w: &mut DartSourceWriter) -> io::Result<()> {
        let typedef_c = format!("_{}_C", self.name);
        let typedef_dart = format!("_{}_Dart", self.name);
        w.write_all(b"\n")?;
        if let Some(ref docs) = self.documentation {
            w.write_all(
                docs.split('\n')
                    .map(|c| format!("/// {}", c))
                    .collect::<Vec<_>>()
                    .join("\n")
                    .as_bytes(),
            )?;
        } else {
            w.write_all(
                format!("/// C function `{}`.\n", self.name).as_bytes(),
            )?;
        }

        w.write_all(b"\n")?;
        w.write_all(
            format!("{} {}(", w.get_dart_type(&self.return_ty), self.name)
                .as_bytes(),
        )?;

        if !self.params.is_empty() {
            w.write_all(b"\n")?;
        }

        for (i, param) in self.params.iter().enumerate() {
            w.write_all(
                format!(
                    "  {} {},\n",
                    w.get_dart_type(&param.ty),
                    param.name.clone().unwrap_or_else(|| format!("arg{}", i))
                )
                .as_bytes(),
            )?;
        }
        w.write_all(b") {\n")?;
        let param_names: Vec<_> = self
            .params
            .iter()
            .enumerate()
            .map(|(i, param)| {
                param.name.clone().unwrap_or_else(|| format!("arg{}", i))
            })
            .collect();
        if w.get_dart_type(&self.return_ty) != "void" {
            w.write_all(b"  return")?;
        }
        w.write_all(format!("   _{}(", self.name).as_bytes())?;
        w.write_all(param_names.join(", ").as_bytes())?;
        w.write_all(b");\n")?;
        w.write_all(b"}\n")?;
        w.write_all(
            format!("final {} _{} = ", typedef_dart, self.name).as_bytes(),
        )?;

        w.write_all(
            format!(
                "_dl.lookupFunction<{}, {}>('{}');\n",
                typedef_c, typedef_dart, self.name
            )
            .as_bytes(),
        )?;

        w.write_all(
            format!(
                "typedef {} = {} Function(",
                typedef_c,
                w.get_ctype(&self.return_ty)
            )
            .as_bytes(),
        )?;

        if !self.params.is_empty() {
            w.write_all(b"\n")?;
        }

        for (i, param) in self.params.iter().enumerate() {
            w.write_all(
                format!(
                    "  {} {},\n",
                    w.get_ctype(&param.ty),
                    param.name.clone().unwrap_or_else(|| format!("arg{}", i))
                )
                .as_bytes(),
            )?;
        }
        w.write_all(b");\n")?;

        w.write_all(
            format!(
                "typedef {} = {} Function(",
                typedef_dart,
                w.get_dart_type(&self.return_ty)
            )
            .as_bytes(),
        )?;

        if !self.params.is_empty() {
            w.write_all(b"\n")?;
        }

        for (i, param) in self.params.iter().enumerate() {
            w.write_all(
                format!(
                    "  {} {},\n",
                    w.get_dart_type(&param.ty),
                    param.name.clone().unwrap_or_else(|| format!("arg{}", i))
                )
                .as_bytes(),
            )?;
        }
        w.write_all(b");\n")?;

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
                ty: "int64_t".to_owned(),
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
                ty: "int64_t".to_owned(),
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
                    ty: "int64_t".to_owned(),
                },
                Param {
                    name: None,
                    ty: "int64_t".to_owned(),
                },
            ],
            "void".to_owned(),
        );
        func.generate_source(&mut dsw).unwrap();
        println!("{}", dsw.to_string());
    }
}
