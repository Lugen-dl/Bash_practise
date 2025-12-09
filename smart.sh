#!/bin/bash

i=$1

if [ -z "$i" ]; then
	echo "Put something"
		exit 1
fi

#Checking that you are in repository
	git rev-parse --is-inside-work-tree
#If everything okay
git add .
	git commit "$i"
git push $(git rev-parse --abbrev-ref HEAD)
