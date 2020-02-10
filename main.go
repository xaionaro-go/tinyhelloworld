package main
// #include <unistd.h>
import "C"
import "unsafe"
func WriteString(fd int, s string) {
        hdr := (*struct{Ptr uintptr})(unsafe.Pointer(&s))
        C.write(
            C.int(fd),
            unsafe.Pointer(hdr.Ptr),
            C.uint(len(s)),
        )
}

func main() {
        WriteString(1, "Hello world!\n")
}

