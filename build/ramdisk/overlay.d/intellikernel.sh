#!/system/bin/sh

chmod 755 /data/adb/sswap

# VNSwap
/data/adb/sswap -s -r
sysctl -w vm.swappiness=130

# Disable adaptive lmk
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk

# SafetyNet
chmod 640 /sys/fs/selinux/enforce;
chmod 440 /sys/fs/selinux/policy;

# Set I/O scheduler back to CFQ
setprop sys.io.scheduler cfq
echo '1024' > /sys/block/mmcblk0/queue/read_ahead_kb
echo '0' > /sys/block/mmcblk0/queue/iostats
echo '2048' > /sys/block/mmcblk1/queue/read_ahead_kb
echo '0' > /sys/block/mmcblk1/queue/iostats

echo 'intelliactive' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo '2265600' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

setenforce 1
