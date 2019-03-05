#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=~/arm32/bin/arm-linux-gnueabihf-

mkdir output

#make -C $(pwd) O=output msm8974_sec_defconfig VARIANT_DEFCONFIG=msm8974pro_sec_klte_eur_defconfig SELINUX_DEFCONFIG=selinux_defconfig
if [ -e output/.config ]
    then
        make -j4 O=output oldconfig
    else
        cp defconfig output/.config
        make -j4 O=output oldconfig
fi

make -j4 O=output

cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage

tools/dtbTool -2 -o output/arch/arm/boot/dt.img -s 2048 -p output/scripts/dtc/ output/arch/arm/boot/
