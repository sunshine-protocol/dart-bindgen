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
fn test_keystore() {
    setup_logger!();
    let config = DynamicLibraryConfig {
        ios: DynamicLibraryCreationMode::Executable.into(),
        android: DynamicLibraryCreationMode::open("libkeystore.so").into(),
        windows: DynamicLibraryCreationMode::open("keystore.dll").into(),
        ..Default::default()
    };
    let bindings = Codegen::builder()
        .with_src_header("tests/headers/keystore.h")
        .with_lib_name("libkeystore")
        .with_config(config)
        .build()
        .unwrap()
        .generate()
        .unwrap();
    bindings.write_to_file("tests/out/keystore.dart").unwrap();
}

#[test]
fn test_allo_isolate() {
    setup_logger!();
    let config = DynamicLibraryConfig {
        ios: DynamicLibraryCreationMode::Executable.into(),
        android: DynamicLibraryCreationMode::open("libkeystore.so").into(),
        windows: DynamicLibraryCreationMode::open("keystore.dll").into(),
        ..Default::default()
    };
    let bindings = Codegen::builder()
        .with_src_header("tests/headers/keystore.h")
        .with_lib_name("libkeystore")
        .with_config(config)
        .with_allo_isolate()
        .build()
        .unwrap()
        .generate()
        .unwrap();
    bindings.write_to_file("tests/out/keystore2.dart").unwrap();
}
