#!/bin/bash

mkdir output

if [ -e output/.config ]
	then
		make -j4 ARCH=arm O=output oldconfig
	else
		cp defconfig output/.config
		make -j4 ARCH=arm O=output oldconfig
fi

DATE_START=$(date +"%s")
make -j$(nproc --all) \
ARCH=arm CC="ccache /home/pascua14/clang/bin/clang" \
CLANG_TRIPLE=arm-linux-gnueabihf- \
CROSS_COMPILE=/home/pascua14/arm32/bin/arm-linux-gnueabihf- \
O=output

tools/dtbTool -2 -o output/arch/arm/boot/dt.img -s 2048 -p output/scripts/dtc/ output/arch/arm/boot/

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
