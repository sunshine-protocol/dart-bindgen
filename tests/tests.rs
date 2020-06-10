use clang::EntityKind;
#[test]
fn test_simple_fn() {
    let clang = clang::Clang::new().unwrap();
    let index = clang::Index::new(&clang, true, false);
    let parser = index.parser("tests/headers/simple_fn.h");
    let tu = parser.parse().unwrap();
    let entity = tu.get_entity();
    let fns = entity.get_children().into_iter().filter(|e| {
        e.get_kind() == EntityKind::FunctionDecl && !e.is_in_system_header()
    });
    for func in fns {
        println!("Signature: {:?}", func);
        println!("Name: {:?}", func.get_name());
        println!("Args: {:#?}", func.get_arguments());
    }
}
