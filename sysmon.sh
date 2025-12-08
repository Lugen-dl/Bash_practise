#!/bin/bash

#Your arguments with assigned processes
i=$(top -b -n 1 | grep "Cpu")
j=$(free)
k=$(df -h | head -5)
#Catalog with your log file (tee command to input into your log)
l="$HOME/shebang/logger/sysmon_$(date +%H-%M-%S).log"
#Catalog where your logs are
n="$HOME/shebang/logger"

(
clear
echo "----Starting to checking your Cpu----"
echo

if [[ $i -gt 80 ]]; then
	echo "Attention! Your CPU Highter than 80%."
		else
	echo "Your CPU is OK. $i"
			echo
fi

echo "----Starting to checking your RAM----"
echo

if [[ $j -gt 80 ]]; then
	echo "Attention! Your RAM Highter than 80%."
		else
	echo "Your RAM is OK. $j"
			echo
fi

echo "----Starting to checking your Memory----"
echo

if [[ $k -gt 90 ]]; then
	echo "Attention! You have a little MEM. "
		else
	echo "Your MEM is OK. $k"
			echo
fi

)	| tee 2>&1 "$l"

echo "Your logs are saving in $n "
