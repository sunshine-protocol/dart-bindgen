use anyhow::{anyhow, Result};
use argh::FromArgs;
use dart_bindgen::{config::*, Codegen};
use std::{path::PathBuf, str::FromStr};
/// dart bindgen, generate Dart FFI bindings to C Header file
#[derive(Debug, FromArgs)]
struct Args {
    /// path to C Header file
    #[argh(option, short = 'i')]
    input: PathBuf,
    /// where to save the output dart ffi file
    /// defaults to the same name of the header file
    /// for example if the input header is `foo.h` the output `foo.dart`
    #[argh(option, short = 'o')]
    output: Option<PathBuf>,
    /// integrate with `allo-isolate` package and generate the binding for
    /// `store_dart_post_cobject` function
    #[argh(switch)]
    allo_isolate: bool,
    /// the C library name (for docs)
    /// defaults for the name of the input header
    /// example if the input header is `foo.h` the name would be `libfoo`
    #[argh(option)]
    name: Option<String>,
    /// how to load the dynamic library when the operating system is a version
    /// of `Android`. [executable, process, any valid path]
    #[argh(option)]
    android: Option<CreationMode>,
    /// how to load the dynamic library when the operating system is a version
    /// `Fuchsia`. [executable, process, any valid path]
    #[argh(option)]
    fuchsia: Option<CreationMode>,
    /// how to load the dynamic library when the operating system is a version
    /// `iOS`. [executable, process, any valid path]
    #[argh(option)]
    ios: Option<CreationMode>,
    /// how to load the dynamic library when the operating system is a version
    /// `Linux`. [executable, process, any valid path]
    #[argh(option)]
    linux: Option<CreationMode>,
    /// how to load the dynamic library when the operating system is a version
    /// `macOS`. [executable, process, any valid path]
    #[argh(option)]
    macos: Option<CreationMode>,
    /// how to load the dynamic library when the operating system is a version
    /// `Windows`. [executable, process, any valid path]
    #[argh(option)]
    windows: Option<CreationMode>,
}

/// Represents the different methods to create a `DynamicLibrary`.
#[derive(Debug, Clone)]
struct CreationMode(DynamicLibraryCreationMode);

impl FromStr for CreationMode {
    // I wish if I can use ! (aka `never` type) here
    type Err = String;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        use DynamicLibraryCreationMode::*;
        match s {
            "executable" => Ok(Self(Executable)),
            "process" => Ok(Self(Process)),
            path => Ok(Self(Open(path.to_owned()))),
        }
    }
}

macro_rules! into_mode {
    ($m:expr) => {
        match $m {
            Some(v) => Some(DynamicLibraryPlatformConfig::new(v.0)),
            _ => None,
        }
    };
}

fn main() -> Result<()> {
    pretty_env_logger::init();
    let args: Args = argh::from_env();

    let config = DynamicLibraryConfig {
        android: into_mode!(args.android),
        fuchsia: into_mode!(args.fuchsia),
        ios: into_mode!(args.ios),
        linux: into_mode!(args.linux),
        macos: into_mode!(args.macos),
        windows: into_mode!(args.windows),
    };

    let output_path = match args.output {
        Some(v) => v,
        None => {
            let mut path = args.input.clone();
            path.set_extension("dart");
            path
        },
    };

    let name = match args.name {
        Some(v) => v,
        None => args
            .input
            .file_stem()
            .map(|name| format!("lib{}", name.to_string_lossy()))
            .ok_or_else(|| anyhow!("Could't make the libname"))?,
    };

    let mut builder = Codegen::builder()
        .with_lib_name(name)
        .with_src_header(args.input)
        .with_config(config);

    if args.allo_isolate {
        builder = builder.with_allo_isolate();
    }

    let codegen = builder.build()?;

    let bindings = codegen.generate()?;
    bindings.write_to_file(output_path)?;

    Ok(())
}
