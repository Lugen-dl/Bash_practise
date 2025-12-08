#!/bin/bash
FILE="urls.txt"

echo "1. Shorten Url"
echo "2. List all Url"

read -p "choose > " choice
case $choise in
	1) 
		read -p "Enter long URL > " url
		read -p "Custom alias (or press Enter for random) > " alias
		#If alias empty - generate random
		if [ -z "$alias" ]; then
			alias=$(cat /dev/urandom | tr -dc 'a-z0-9' | head -c 6)
		fi
	
		#Saving
		echo "$alias -> $url" >> "$FILE"
		echo "Shortened: $alias"
		;;

	2)
		cat "$FILE"
		;;
esac
