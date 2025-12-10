#!/bin/bash


read -p "Put the name for your new branch > " i
	read -p "put the name of your new task/branch > " j
			full="$i/$j"
if [ -z "$i" ]; then
	echo "Not validated"
else
	git checkout -b "$full"
fi
