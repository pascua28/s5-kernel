#!/system/bin/sh

chmod 755 /data/adb/sswap

# VNSwap
/data/adb/sswap -s -r
sysctl -w vm.swappiness=130

# Disable adaptive lmk
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk

# Set I/O scheduler back to CFQ
echo 'cfq' > /sys/block/mmcblk0/queue/scheduler
echo '0' > /sys/block/mmcblk0/queue/iostats
echo '0' > /sys/block/mmcblk1/queue/iostats

setenforce 1
