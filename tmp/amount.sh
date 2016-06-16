#!/tmp/busybox sh

BB=/tmp/busybox

systemfs=$(eval $($BB blkid /dev/block/platform/msm_sdcc.1/by-name/system | $BB awk ' { print $3 } '); $BB echo $TYPE);

$BB mount -t $systemfs /dev/block/platform/msm_sdcc.1/by-name/system /system;
