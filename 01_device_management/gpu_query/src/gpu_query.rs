#[link(name = "hello_gpu", kind = "static")]
unsafe extern "C" {
    fn hello()->i32;
    fn hello_gpu();
    fn query_gpu()->i32;
}

pub fn call_c() {
    unsafe {
        let i:i32 = hello();
        println!("{}",i);
    }
}
pub fn call_gpu() {
    unsafe {
        hello_gpu();
    }
}
pub fn call_query_gpu()->i32 {
    unsafe {
        query_gpu()
    }
}

pub fn gpu_query(){
    println!("Hello from GPU Qeury.");
    call_c();
    call_gpu();
    let _res:i32 = call_query_gpu();
}
