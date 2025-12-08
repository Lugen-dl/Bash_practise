#!/bin/bash

#Checking file date
k="$(mkdir) loggerf"
i=1
j="/home/practise/shebang/"
if [[ -z '*.log' ]]; then
	echo "There is no .sh files"
		else		
	find $j -name '*.log' -mtime +$i -print0 |
		xargs 
	tar -czvf archive.tar.gz 
		elif
	find $j -name '*.log' -mtime +$i | rm
	
fi

for w in "$HOME/shebang/30_november/"; do
	if [[ -z $w ]]; then
		mkdir "loggerf"
	elif
		mv "archive.tar.gz" "$w/loggerf"
	elif
		"$(tar -tf) archive.tar.gz"
		fi
done
	 
