#!/bin/bash

experiment() {
	local cores="$2"
	echo "Beginning tests. This may take a while"
	./logtemps.sh &
	LOGGER_PID=$!
	echo "Temperature Logging started @PID $LOGGER_PID"
	echo "Beginning 7z benchmark (4 Threads)"
	taskset -ac "$cores" 7z b 10 -mmt=4 -md=22 > "$1"_4threads.log
	# Use for all threads
	# 7z b 10 -md=22 > "$1"_threads.log
	echo "Beginning 7z benchmark (1 Thread)"
	taskset -ac "$cores" 7z b 10 -mmt=1 -md=22 > "$1"_1thread.log
	echo "done" >> templog.txt
	echo "Done. Stopping Logging"
	kill -9 $LOGGER_PID
	mv templog.txt "$1"_templog.txt
}

little_array="0,1,2,3"
big_array="4,5,6,7"
all_array="0,1,2,3,4,5,6,7"

echo "Testing Big Cores"
experiment "big" $big_array
echo "Waiting for cooldown"
sleep 5
echo "Testing Little Cores"
experiment "little" $little_array

# To Measure all arrays, it's easier to just switch around comment lines at this stage.
# TODO: Add conditionals to experiment functions to avoid this.
#echo "Testing All Cores"
#experiment "all" $all_array
