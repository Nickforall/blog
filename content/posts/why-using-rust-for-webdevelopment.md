---
title: "Why I use Rust as a webdeveloper"
date: 2017-09-05T23:30:00+02:00
draft: false
description: "I have been messing around with Mozilla's programming language Rust for a while now. This blog post summarizes why I like it so much so far, and why I think you should consider using it for your project."
---


I have been messing around with Mozilla's programming language Rust for a while now. This blog post summarizes why I like it so much so far, and why I think you should consider using it for your project.

# What is Rust?
Rust is a programming language designed by Mozilla, it’s a systems programming language with high-level language features, focussed on safety and performance.

In a nutshell, your code runs directly on the cpu. It is optimized at compile time, and the compiler checks whether you do unsafe things that might cause a segfault. At the same time, it feels very much like a high-level language, you don’t have to deal with things like `malloc` and `free` as you would with C.

# Performance

Performance is a huge advantage you get when using Rust. Instead of running your code on a virtual machine, like most languages used for web development, Rust code runs directly on the cpu.

## Less layers

![Rust vs PHP+Apache](http://i.imgur.com/QiD1kM4.png)

Usually, I would write a project in PHP. In that use-case, you would have Apache or Nginx running to handle all your networking. They will execute your PHP code in the PHP Virtual Machine, which will run its code on the cpu.

With Rust, you take control of everything, you handle the network request, the logic, and the HTTP response. This can be scary at first, but it means that your code only goes through one layer: your Rust code.

## Code Optimization

Another advantage is that Rust is a compiled language, this means there’s space to optimize your code before running it. When running a javascript in node.js, it will just run the code you wrote in its VM.

With Rust this is a little different, the code you wrote is completely different from what will be running on a cpu. It’ll remove things like useless if-statements and unused imports, for example:

```rust
// what you wrote
fn some_in_efficient_function() -> i32 {
    // the compiler knows this if statement is always true
    if(true) {
        return 100;
    } else {
        return 1;
    }
}

// what it looks like after optimization
fn efficient_function() -> i32 {
    // because the function above only returns `100`, the compiler
    // removes unnecessary instructions like the if statement
    return 100;
}
```

# But why Rust
But why Rust? There are many languages that run on the cpu, like Go, C, C++, and Crystal. Rust has several features that make it even faster and safer.

## Safety

Rust’s compiler is very smart, it prevents you from making a lot of mistakes that people coming from high-level languages tend to make in C or C++. But it doesn’t prevent you from writing complex code, doing unsafe things is possible in Rust by explicitly putting it inside an `unsafe` block.

```rust
// make the variable a reference to an address
let address = 0xDEADBEEF;
let r = address as *const i32;

unsafe {
    // access this memory address, which is unsafe.
    println!("{:x}", *r);
}
```

## Memory Allocation

Normally, when writing C code, you would free the variable in memory with the `free` function. In Rust, you don’t have to care about memory allocation. Crystal and Go solve this problem by a garbage collector, which is extra code running at runtime, slowing your program down.

In Rust, every variable gets freed when it goes out of scope unless it has a lifetime. Lifetimes are ways to manually specify how long a variable is available. But generally, you don’t have to care about it.

## Helpful error messages

All these safety precautions can produce a lot of warnings and errors at first. Rust's compiler is often praised for its useful error messages, it tells you what went wrong, where it went wrong, and provides you with an error code that you can find on the [Compiler Error Index](https://doc.rust-lang.org/error-index.html). The error index often contains information on how to fix this.

## Package Manager

Rust has [Cargo](http://crates.io/), a great package manager that takes care of compiling large multifile projects, and managing dependencies. It offers a wide variety of packages, that helps you to save a lot of time, by using open source libraries in your project.

# In conclusion

Rust is a great language to increase the performance of your applications, it is significatnly faster than high level language, and some systems languages. All this without making too many compromises, offering high-level language feature, safety, and a great package manager.

# Resources to get started.

**So you got excited about Rust?**

Rust has a great community, the people on forums, subreddits, and IRC channels are very friendly and helpful. Don’t be afraid to ask questions Below you’ll find resources for getting into Rust.

* [The first Rust Book](https://doc.rust-lang.org/book/first-edition/) is written by the rust team, and documents a lot of the language features. It's getting outdated though, as the second book is being written.
* [The second rust book](https://doc.rust-lang.org/book/second-edition/) is the new version of the first book. Some chapters may be incomplete. But it already is more comprehensive than the first one.
* [Rust by example](https://rustbyexample.com/) is a website that contains examples for most of the language's features.
* [#rust-beginners](https://chat.mibbit.com/?server=irc.mozilla.org&channel=%23rust-beginners) is an IRC channel on `irc.mozilla.org` where people are ready to help you with all of your issues.
* [/r/rust](https://reddit.com/r/rust) The rust subreddit is where people post about what keeps them busy regarding Rust.
* [Rust users forum](https://users.rust-lang.org/) is a forum where you can ask for help and discuss about the language.
* [This week in rust](https://this-week-in-rust.org/) is a weekly newsletter I really enjoy, it covers new projects and crates, as well as interesting blog posts.
