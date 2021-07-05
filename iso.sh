#!/bin/sh
set -e
. ./build.sh
 
mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub
 
cp sysroot/boot/lnix.kernel isodir/boot/lnix.kernel
cat > isodir/boot/grub/grub.cfg << EOF
timeout=0
default=0
menuentry "myos" {
	multiboot2 /boot/lnix.kernel
}
EOF
grub-mkrescue -o myos.iso isodir