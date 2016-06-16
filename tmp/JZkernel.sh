#!/tmp/busybox sh

BB=/tmp/busybox
$BB chown system:system /sys/devices/virtual/lg_rgb_led/use_patterns/setting;
$BB chmod 0644 /sys/devices/virtual/lg_rgb_led/use_patterns/setting;
thermal_path=`$BB find /system -name "thermal-engine"`;


case $1 in
		flash_start)
			$BB echo 1 > /sys/devices/virtual/lg_rgb_led/use_patterns/setting;
		;;
		finished)
			$BB chmod 0644 /system/lib/modules/*
			$BB echo 29 > /sys/devices/virtual/lg_rgb_led/use_patterns/setting;
			sleep 1;
			$BB echo 0 > /sys/devices/virtual/lg_rgb_led/use_patterns/setting;
		;;
		thermaltweak)
			if [ -e ${thermal_path} ];then
				$BB sed -i -e 's/sys\/devices\/system\/cpu/sas\/davicas\/sestem\/cnu/g' ${thermal_path}
				$BB sed -i -e 's/scaling_*/scaagg_m/g' ${thermal_path}
				$BB sed -i -e 's/am broadcast/am beoasdast/g' ${thermal_path}
				$BB sed -i -e 's/devices\/system\/cpu\/cpu/devices\/system\/cau\/cru/g' ${thermal_path}
			fi
esac;

exit 0
