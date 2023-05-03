#!/bin/bash

cat >linkerscript.env <<EOF
text_addr = 0x010000$(printf '%x' "$(stat -c %s emptyelf)");
EOF
