#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=~/ubertc/bin/arm-eabi-

mkdir output

make -C $(pwd) O=output lineage_klte_pn547_defconfig
make -j8 -C $(pwd) O=output

cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage

tools/dtbTool -2 -o output/arch/arm/boot/dt.img -s 2048 -p output/scripts/dtc/ output/arch/arm/boot/
