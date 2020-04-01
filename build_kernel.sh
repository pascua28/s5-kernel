#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=~/androideabi/bin/arm-linux-androideabi-

#make -C $(pwd) O=output msm8974_sec_defconfig VARIANT_DEFCONFIG=msm8974pro_sec_klte_eur_defconfig SELINUX_DEFCONFIG=selinux_defconfig
if [ -e .config ]
    then
        make -j4 oldconfig
    else
        cp defconfig .config
        make -j4 oldconfig
fi

make -j4 2>&1 |tee ../compile.log

tools/dtbTool -2 -o arch/arm/boot/dt.img -s 2048 -p scripts/dtc/ arch/arm/boot/
