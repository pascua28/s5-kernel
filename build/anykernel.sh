# AnyKernel2 Ramdisk Mod Script
#
# Original and credits: osm0sis @ xda-developers
#
# Modified by sunilpaulmathew @ xda-developers.com

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Intelli-kernel by pascua28 @ xda-developers
do.devicecheck=1
do.initd=0
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=kltexx
device.name2=kltelra
device.name3=kltetmo
device.name4=kltecan
device.name5=klteatt
device.name6=klteub
device.name7=klteacg
device.name8=klte
device.name9=kltekor
device.name10=klteskt
device.name11=kltektt
device.name12=kltekdi
device.name13=kltedv
device.name14=kltespr
device.name15=
'; } # end properties

# shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
add_seandroidenforce=1
supersu_exclusions=""
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
mount -o rw,remount /system;

chmod 755 $ramdisk/overlay.d/sbin/busybox

## AnyKernel install
dump_boot;

ASD=$(cat /system/build.prop | grep ro.build.version.sdk | cut -d "=" -f 2)

if [ "$ASD" == "24" ] || [ "$ASD" == "25" ]; then
	ui_print "Andoid 7.0/7.1 detected!";
	touch $ramdisk/nougat;

	if [ ! -d "/system/vendor/cameradata" ]; then
		mount -o rw,remount /system;
		ln -s /system/cameradata /system/vendor/cameradata;
	fi
else
	ui_print "Android 8.0/8.1/9.0/10/11 detected!";
fi

write_boot;

## end install

