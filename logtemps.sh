#!/bin/sh
while true
do
	echo "$(date) temp: $(cat /sys/devices/virtual/thermal/thermal_zone0/temp)" >> templog.txt
	sleep 2
done
