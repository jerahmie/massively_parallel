
// Example custom build script
fn main() {
    // Tell Cargo that if the given file changes, to rerun this build script.
    println!("cargo::rerun-if-changed=src/helloc");
    // Use the `cc` crate to build a C file and statically link it.
    //cc::Build::new()
    //    .file("src/hello.c")
    //    .compile("hello");
    cc::Build::new()
        .cuda(true)
        .cudart("static")
        .file("src/hello_gpu.cu")
        .compile("hello_gpu");
}

