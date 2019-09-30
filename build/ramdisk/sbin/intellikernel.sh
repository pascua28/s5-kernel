#!/system/bin/sh

# VNSwap
/sbin/sswap -s -r
sysctl -w vm.swappiness=130

# Interactive governor tweaks
echo '20000 1190400:60000 1728000:75000 1958400:80000 2265600:100000' > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo '99' > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo '1190400' > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo '0' > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo '40000' > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo '98 268800:28 300000:12 422400:34 652800:41 729600:12 883200:52 960000:9 1036800:8 1190400:73 1267200:6 1497600:87 1574400:5 1728000:89 1958400:91 2265600:94' > /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo '40000' > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo '80000' > /sys/devices/system/cpu/cpufreq/interactive/timer_slack

# Disable adaptive lmk
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk

# Set I/O scheduler back to CFQ
setprop sys.io.scheduler cfq
echo '1024' > /sys/block/mmcblk0/queue/read_ahead_kb
echo '0' > /sys/block/mmcblk0/queue/iostats
echo '2048' > /sys/block/mmcblk1/queue/read_ahead_kb
echo '0' > /sys/block/mmcblk1/queue/iostats
