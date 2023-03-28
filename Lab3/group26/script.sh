#! /bin/sh
#CO224

arm-linux-gnueabi-gcc -Wall $1.s -o $1
qemu-arm -L /usr/arm-linux-gnueabi $1

