package main
// #include <unistd.h>
import "C"
import "unsafe"
func Write(fd int, s *uint32, l uint) {
        C.write(C.int(fd), unsafe.Pointer(s), C.uint(l))
}
func main() {
        for idx, v := range []uint32{
                0x6c6c6548, // "Hell"
                0x6f77206f, // "o Wo"
                0x21646c72, // "rld!"
                0x0000000a, // "\n"
        } {
                l := uint(4)
                if idx == 3 {
                        l = 1
                }
                Write(1, &v, l)
        }
}
