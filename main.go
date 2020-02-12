package main

import (
	"syscall"
	"unsafe"
)

func WriteString(fd int, s string) {
	hdr := (*struct{Ptr uintptr})(unsafe.Pointer(&s))
	syscall.Syscall(4, uintptr(fd), hdr.Ptr, uintptr(len(s)))
}

func main() {
	WriteString(1, "Hello, world!\n")
}

