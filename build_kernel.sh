#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=~/linaro-4.9/bin/arm-linux-gnueabihf-

mkdir output

make -j4 O=output klte_defconfig

DATE_START=$(date +"%s")

make -j4 CONFIG_DEBUG_SECTION_MISMATCH=y \
	O=output 2>&1 | tee ../compile.log

cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
tools/dtbTool -2 -o output/arch/arm/boot/dt.img -s 2048 -p output/scripts/dtc/ output/arch/arm/boot/

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))

echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
