#!/bin/bash

LOGFILE=""
TYPE=""

usage() {
	echo "Usage: $0 -f [-t ERROR|WARN|INFO]"
	exit 1
}

while getopts "f:t:h" option; do
	case $option in

	f)		LOGFILE="$OPTARG" 
	;;
	t)		TYPE="$OPTARG" 
	;;
	h)		usage	
	;;
	\?)		usage
	;;
esac
done
	if  [ -z $LOGFILE ]; then
		usage
	fi
	
	if [ ! -f "$LOGFILE" ]; then
		echo "Error: File not Found $LOGFILE"
		exit 1
	fi
