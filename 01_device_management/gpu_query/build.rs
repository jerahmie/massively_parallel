
// Example custom build script
fn main() {
    // Tell Cargo that if the given file changes, to rerun this build script.
    println!("cargo::rerun-if-changed=src/hello.c");
    // Use the `cc` crate to build a C file and statically link it.
    cc::Build::new()
        .file("src/hello.c")
        .compile("hello");
    println!("cargo::rerun-if-changed=src/hello_gpu.cu");
    cc::Build::new()
        .ccbin(false) 
        .cuda(true)
        .flag("-gencode")
        .flag("arch=compute_60,code=sm_60")
        .flag("-gencode")
        .flag("arch=compute_61,code=sm_61")
        .flag("-gencode")
        .flag("arch=compute_62,code=sm_62")
        .flag("-gencode")
        .flag("arch=compute_80,code=sm_80")
        .flag("-gencode")
        .flag("arch=compute_80,code=compute_80")
        .flag("-allow-unsupported-compiler")
        .flag("-std=c++17")
        .file("src/hello_gpu.cu")
        .compile("libhello_gpu.a");

    /* Link CUDA Runtime (libcudart.so) */
    println!("cargo:rustc-link-search=native=/usr/lib/x86_64-linux-gnu");
    println!("cargo:rustc-link-lib=cudart");
    println!("cargo:rustc-link-lib=cuda");

}

