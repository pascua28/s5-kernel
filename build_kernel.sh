#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=~/ubertc/bin/arm-eabi-

mkdir output

if [ -e output/.config ]
    then
        make -j4 O=output oldconfig
    else
        cp defconfig output/.config
        make -j4 O=output oldconfig
fi

DATE_START=$(date +"%s")

make -j4 CONFIG_DEBUG_SECTION_MISMATCH=y \
	O=output 2>&1 | tee ../compile.log

cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
tools/dtbTool -2 -o output/arch/arm/boot/dt.img -s 2048 -p output/scripts/dtc/ output/arch/arm/boot/

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))

echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
