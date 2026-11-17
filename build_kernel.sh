#!/bin/sh

set -e -x
# make mrproper
# rm -rf out
# mkdir -p out

ROOT="$(pwd)"
export PATH="$ROOT/toolchain/clang/bin:$ROOT/toolchain/gcc/bin:$PATH"

export ARCH=arm
export CROSS_COMPILE=arm-linux-androideabi-
export CLANG_TRIPLE=arm-linux-gnueabi-
export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y
export CFLAGS_WARN=-Wunused-but-set-variable
export xxx="CC=clang LD=ld.lld KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y CFLAGS_WARN=-Wunused-but-set-variable ARCH=arm CROSS_COMPILE=arm-linux-androideabi- CLANG_TRIPLE=arm-linux-gnueabi-"
# make O=out $xxx a02_defconfig
make O=out $xxx -j"$(nproc --all)" zImage-dtb 2>&1 | tee build.log
