<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  </a>
  <br />
  To the extent possible under law,
  <a rel="dct:publisher"
     href="https://github.com/xaionaro/">
    <span property="dct:title">Dmitrii Okunev</span></a>
  has waived all copyright and related or neighboring rights to
  "<span property="dct:title">A very synthetic, but very small hello world on Go</span>.
This work is published from:
<span property="vcard:Country" datatype="dct:ISO3166"
      content="IE" about="https://github.com/xaionaro-go/tinyhelloworld">
  Ireland</span>".
</p>

# Quick start

```sh
$ make clean
$ docker build -t build-go-tinyhelloworld . && docker run -v "$(pwd):/project" build-go-tinyhelloworld
$ stat -c %s ./tinyhelloworld
99
$ ./tinyhelloworld 
Hello, world!
```

# Hexdump
``````
$ hexdump -C tinyhelloworld 
00000000  7f 45 4c 46 01 00 00 00  00 00 00 00 00 00 00 01  |.ELF............|
00000010  02 00 03 00 00 00 00 01  2e 00 00 01 04 00 00 00  |................|
00000020  00 00 00 00 00 00 00 00  00 00 20 00 01 00 e8 09  |.......... .....|
00000030  00 00 00 31 c0 31 db 40  cd 80 66 90 53 31 db 43  |...1.1.@..f.S1.C|
00000040  b9 55 00 00 01 ba 0e 00  00 00 b8 04 00 00 00 cd  |.U..............|
00000050  80 31 c0 5b c3 48 65 6c  6c 6f 2c 20 77 6f 72 6c  |.1.[.Hello, worl|
00000060  64 21 0a                                          |d!.|
00000063
``````

# Comments

`elf.asm` is just ELF-headers and a wrapper to call the `main()`.

The binary could be even less if we place our useful data right into the ELF headers
(see [an example](http://www.muppetlabs.com/~breadbox/software/tiny/hello.asm.txt)).

# See also

* [Using Rust to make a 151-byte static AMD64 Linux binary](https://github.com/kmcallister/tiny-rust-demo).
* [A "hello, world" in a 62-byte ELF using NASM](http://www.muppetlabs.com/~breadbox/software/tiny/hello.asm.txt).

# Why is Go binary so big

A collection of articles explains some details about Go:
* [Go language goroutine scheduler initialization](https://cloud.tencent.com/developer/article/1450278)
