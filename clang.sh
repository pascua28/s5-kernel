#!/bin/bash

export ARCH=arm

mkdir output

if [ -e output/.config ]
    then
        make -j4 O=output oldconfig
    else
        cp defconfig output/.config
        make -j4 O=output oldconfig
fi

make O=output ARCH=arm CC=clang \
CLANG_TRIPLE=arm-linux-gnueabihf- \
CROSS_COMPILE=arm-linux-gnueabihf- \
CONFIG_DEBUG_SECTION_MISMATCH=y \
-j$(nproc --all) 2>&1 | tee ../compile.log

cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage

tools/dtbTool -2 -o output/arch/arm/boot/dt.img -s 2048 -p output/scripts/dtc/ output/arch/arm/boot/
