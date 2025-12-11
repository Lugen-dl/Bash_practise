#!/bin/bash

i="~/git-test"
j="$(git for-each-ref)"

for dir in "$i"; do
	if [[ $dir != $i ]]; 
		then
exit 1
	else
	git pull "$dir"
		echo "		--THOSE BRANCHES WERE UPDATED--		"
		echo "$j"
		fi	
done

