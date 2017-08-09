---
title: "Hello, World!"
date: 2017-08-09T13:25:14+02:00
draft: false
description: "Hello, World! And welcome to my blog. On this Blog I'll write about my side- and
toy projects, as well as my experiences while learning Rust as a webdeveloper."
---

# Hello, World! And welcome to my blog.

My name is Nick, I am an 18 year old web developer from the Netherlands. I have
been programming for a long time. I am a student at the Rotterdam University of
Applied Sciences, where I study "Creative Media and Game Technologies".
Recently I got more interested in systems programming, which is why I started
to mess around with Rust. On this blog I'll talk about my little side projects,
publish tutorials and talk about my experiences of learning Rust as a webdeveloper.

## Tech behind this blog
This blog is powered by [Hugo](https://gohugo.io/), an open-source static site
generator. I use the theme [hucore](https://themes.gohugo.io/hucore/), which I
plan to edit a bit in the future.

The source code of this blog is hosted on [Github](https://github.com/Nickforall/blog),
feel free to post an issue when you find a Mistake in one of my posts. I'll be
accepting pull-requests for code-related issues.

```rust
fn main() {
    println!("Hello, World!");
}
```

```javascript
console.log("Hello, World!")
```

```x86asm
; nasm -f macho64 -o program.o src/helloworld.asm && ld program.o -o program && ./program

global start
section .text
start:
    mov rax, 0x2000004 ; write syscall
    mov rdi, 1 ; stdout
    mov rsi, str ; message
    mov rdx, strlen ; length of the message
    syscall

    mov rax, 0x2000001 ; exit syscall
    mov rdi, 0 ; exit code
    syscall


section .data
str:
  db `Hello, world!\n` ; message string
strlen equ $ - str
```
