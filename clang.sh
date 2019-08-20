#!/bin/bash

if [ -e .config ]
	then
		make -j4 ARCH=arm oldconfig
	else
		cp defconfig .config
		make -j4 ARCH=arm oldconfig
fi

DATE_START=$(date +"%s")

git apply gcc_prebuilts

export KBUILD_COMPILER_STRING=$(~/clang/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')

make -j$(nproc --all) \
ARCH=arm CC="ccache /home/pascua14/clang/bin/clang" \
CLANG_TRIPLE=arm-linux-gnueabihf- \
CROSS_COMPILE=/home/pascua14/arm32/bin/arm-linux-gnueabihf- \
zImage

git apply -R gcc_prebuilts

tools/dtbTool -2 -o arch/arm/boot/dt.img -s 2048 -p scripts/dtc/ arch/arm/boot/

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
