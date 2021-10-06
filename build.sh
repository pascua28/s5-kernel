#!/bin/bash

K_NAME="Intelli-Kernel"
K_VERSION="v15"

make ARCH=arm klte_defconfig
find arch/arm/boot/ -name "*.dtb" -type f -delete
case "$1" in
	klte)
    echo "Compiling kernel for klte"
    DEVICE_NAME="klte"
    ;;

	kltedv)
    scripts/configcleaner "
CONFIG_NFC_PN547
CONFIG_NFC_PN547_PMC8974_CLK_REQ
CONFIG_BCM2079X_NFC_I2C
"

    echo "
# CONFIG_NFC_PN547 is not set
# CONFIG_NFC_PN547_PMC8974_CLK_REQ is not set
CONFIG_BCM2079X_NFC_I2C=y
" >> .config

    echo "Compiling kernel for kltedv"
    DEVICE_NAME="kltedv"
    ;;

	kltekdi)
    scripts/configcleaner "
CONFIG_MACH_KLTE_EUR
CONFIG_MACH_KLTE_JPN
CONFIG_MACH_KLTE_KDI
CONFIG_NFC_PN547
CONFIG_NFC_PN547_PMC8974_CLK_REQ
CONFIG_USE_VM_KEYBOARD_REJECT
CONFIG_CHARGER_SMB1357
CONFIG_CHARGER_MAX77804K
CONFIG_FELICA
CONFIG_NFC_FELICA
CONFIG_CHARGE_LEVEL
"

    echo "
# CONFIG_MACH_KLTE_EUR is not set
CONFIG_MACH_KLTE_JPN=y
CONFIG_MACH_KLTE_KDI=y
# CONFIG_NFC_PN547 is not set
# CONFIG_NFC_PN547_PMC8974_CLK_REQ is not set
# CONFIG_USE_VM_KEYBOARD_REJECT is not set
CONFIG_CHARGER_SMB1357=y
# CONFIG_CHARGER_MAX77804K is not set
CONFIG_FELICA=y
CONFIG_NFC_FELICA=y
# CONFIG_CHARGE_LEVEL is not set
" >> .config

    echo "Compiling kernel for kltekdi"
    DEVICE_NAME="kltekdi"
    ;;

	kltechn)
    scripts/configcleaner "
CONFIG_MACH_KLTE_EUR
CONFIG_MACH_KLTE_CHN
CONFIG_MACH_KLTE_CU
CONFIG_SEC_LOCALE_CHN
CONFIG_WLAN_REGION_CODE
CONFIG_USE_VM_KEYBOARD_REJECT
CONFIG_W1_CF
CONFIG_SND_SOC_ES704_TEMP
CONFIG_SENSORS_FPRINT_SECURE
"

    echo "
# CONFIG_MACH_KLTE_EUR is not set
CONFIG_MACH_KLTE_CHN=y
CONFIG_MACH_KLTE_CU=y
CONFIG_SEC_LOCALE_CHN=y
CONFIG_WLAN_REGION_CODE=300
# CONFIG_USE_VM_KEYBOARD_REJECT is not set
CONFIG_W1_CF=y
CONFIG_SND_SOC_ES704_TEMP=y
CONFIG_SENSORS_FPRINT_SECURE=y
" >> .config

    echo "Compiling kernel for kltechn"
    DEVICE_NAME="kltechn"
    ;;

	kltekor)
    scripts/configcleaner "
CONFIG_MACH_KLTE_EUR
CONFIG_MACH_KLTE_KOR
CONFIG_MACH_KLTE_KTT
CONFIG_MSM_L2_ERP_PORT_PANIC
CONFIG_WLAN_REGION_CODE
CONFIG_SEC_DEVIDE_RINGTONE_GAIN
CONFIG_SND_SOC_ES704_TEMP
CONFIG_USB_LOCK_SUPPORT_FOR_MDM
CONFIG_SENSORS_SSP_SHTC1
"

    echo "
# CONFIG_MACH_KLTE_EUR is not set
CONFIG_MACH_KLTE_KOR=y
CONFIG_MACH_KLTE_KTT=y
CONFIG_MSM_L2_ERP_PORT_PANIC=y
CONFIG_WLAN_REGION_CODE=200
CONFIG_SEC_DEVIDE_RINGTONE_GAIN=y
CONFIG_SND_SOC_ES704_TEMP=y
CONFIG_USB_LOCK_SUPPORT_FOR_MDM=y
CONFIG_SENSORS_SSP_SHTC1=y
" >> .config

    echo "Compiling kernel for kltekor"
    DEVICE_NAME="kltekor"
    ;;

	klteduos)
    scripts/configcleaner "
CONFIG_MACH_KLTE_LTNDUOS
"

    echo "
CONFIG_MACH_KLTE_LTNDUOS=y
" >> .config

    echo "Compiling kernel for klteduos"
    DEVICE_NAME="klteduos"
    ;;

	klteactive)
    scripts/configcleaner "
CONFIG_SEC_K_PROJECT
CONFIG_MACH_KLTE_EUR
CONFIG_SEC_KACTIVE_PROJECT
CONFIG_MACH_KACTIVELTE_EUR
CONFIG_SENSORS_HALL
CONFIG_SENSORS_HALL_IRQ_CTRL
CONFIG_KEYBOARD_CYPRESS_TOUCHKEY
CONFIG_SENSORS_FINGERPRINT
CONFIG_SENSORS_FINGERPRINT_SYSFS
CONFIG_SENSORS_VFS61XX
CONFIG_SENSORS_VFS61XX_KO
CONFIG_SENSORS_FPRINT_SECURE
"

  echo "
# CONFIG_SEC_K_PROJECT is not set
# CONFIG_MACH_KLTE_EUR is not set
CONFIG_SEC_KACTIVE_PROJECT=y
CONFIG_MACH_KACTIVELTE_EUR=y
# CONFIG_SENSORS_HALL is not set
# CONFIG_SENSORS_HALL_IRQ_CTRL is not set
# CONFIG_KEYBOARD_CYPRESS_TOUCHKEY is not set
# CONFIG_SENSORS_FINGERPRINT is not set
" >> .config

    echo "Compiling kernel for klteactive"
    DEVICE_NAME="klteactive"
;;
esac

ZIP_NAME=$K_NAME-$K_VERSION-$DEVICE_NAME.zip

case "$2" in
	test)
    K_NAME=""
    K_VERSION="test"
    ZIP_NAME="s5-test.zip"
    echo "This is a test build!!!"
;;
esac

DATE_START=$(date +"%s")

make ARCH=arm \
CROSS_COMPILE=arm-linux-gnueabihf- \
-j$(nproc --all) 2>&1 | tee ../compile.log

tools/dtbTool -2 -o arch/arm/boot/dtb -s 2048 -p scripts/dtc/ arch/arm/boot/

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))

mv arch/arm/boot/zImage build/zImage
mv arch/arm/boot/dtb build/dt

cd build/
zip -r -9 ../../$ZIP_NAME *
rm zImage
rm dt
rm -rf ramdisk/sbin/

if [ "$K_VERSION" == "test" ]; then
	cd ../
fi

echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
