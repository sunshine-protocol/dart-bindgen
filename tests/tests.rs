use dart_bindgen::{config::*, Codegen};
use log::LevelFilter;
use simplelog::{TermLogger, TerminalMode};

macro_rules! setup_logger {
    () => {
        TermLogger::init(
            LevelFilter::Debug,
            Default::default(),
            TerminalMode::Mixed,
        )
        .unwrap();
    };
}

#[test]
fn test_simple_fn() {
    setup_logger!();
    let config = DynamicLibraryConfig {
        ios: DynamicLibraryCreationMode::Executable.into(),
        android: DynamicLibraryCreationMode::open("libsimple.so").into(),
        windows: DynamicLibraryCreationMode::open("simple.dll").into(),
        ..Default::default()
    };
    Codegen::builder()
        .with_input_header_path("tests/headers/simple.h")
        .with_output_dart_file("tests/out/simle.dart")
        .with_lib_name("libsimple")
        .with_config(config)
        .build()
        .unwrap()
        .generate()
        .unwrap();
}
