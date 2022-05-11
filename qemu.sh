#!/bin/sh
set -e
. ./gen_iso.sh

qemu-system-$(./target-triplet-to-arch.sh $HOST_ARCH) -cdrom lnix.iso
