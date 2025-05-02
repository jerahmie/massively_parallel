// Test call C function from Rust.
//
unsafe extern "C" {
    fn hello();
}

pub fn call() {
    unsafe {
        hello();
    }
}

fn main() {
    println!("Hello, from Rust!");
    call();
}
