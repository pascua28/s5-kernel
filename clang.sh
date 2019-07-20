#!/bin/sh

mkdir output

if [ -e output/.config ]
	then
		make -j4 O=output oldconfig
	else
		cp defconfig output/.config
		make -j4 O=output oldconfig
fi

make -j$(nproc --all) \
ARCH=arm CC=/home/pascua14/clang/bin/clang \
CLANG_TRIPLE=arm-linux-gnueabihf- \
CROSS_COMPILE=/home/pascua14/arm32/bin/arm-linux-gnueabihf- \
O=output
