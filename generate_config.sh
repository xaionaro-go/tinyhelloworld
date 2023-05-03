#!/bin/bash

TEXT_ADDR=0x010000"$(printf '%x' "$(stat -c %s emptyelf)")"
cat > custom.json <<EOF
{
        "llvm-target": "i386-pc-linux-gnu",
        "goos": "linux",
        "goarch": "386",
        "gc": "none",
        "scheduler": "none",
        "linker": "ld.lld",
        "cflags": [
        ],
        "ldflags": [
                "--lto-O3", "-Ttext=$TEXT_ADDR", "-entry=actual_main", "--relax", "-Tlinkerscript.ld"
        ]
}
EOF
