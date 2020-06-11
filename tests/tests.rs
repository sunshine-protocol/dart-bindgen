use dart_bindgen::{config::*, Codegen};
#[test]
fn test_simple_fn() {
    let config = DynamicLibraryConfig {
        ios: DynamicLibraryCreationMode::Executable.into(),
        android: DynamicLibraryCreationMode::open("libaddr_ffi.so").into(),
        windows: DynamicLibraryCreationMode::open("target/addr_ffi.dll").into(),
        ..Default::default()
    };
    Codegen::builder()
        .with_input_header_path("tests/headers/simple_fn.h")
        .with_output_dart_file("tests/out/simle_fn.dart")
        .with_lib_name("libadder")
        .with_config(config)
        .build()
        .unwrap()
        .generate()
        .unwrap();
}

#[test]
fn test_sqlite3() {
    let config = DynamicLibraryConfig {
        ios: DynamicLibraryCreationMode::Executable.into(),
        android: DynamicLibraryCreationMode::open("libsqlite.so").into(),
        windows: DynamicLibraryCreationMode::open("target/sqlite.dll").into(),
        ..Default::default()
    };
    Codegen::builder()
        .with_input_header_path("tests/headers/sqlite3.h")
        .with_output_dart_file("tests/out/sqlite.dart")
        .with_lib_name("libsqlite")
        .with_config(config)
        .build()
        .unwrap()
        .generate()
        .unwrap();
}
