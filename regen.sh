#!/bin/bash

export ARCH=arm

mkdir output

cp -f defconfig output/.config
make -j4 O=output oldconfig
cp -f output/.config defconfig
