#!/bin/bash


conf () {
	echo "Checking the status"
	if [[ -z $(git status | grep -q "nothing to commit") ]]; then
		echo "Everything indexed"
			exit 0
	elif [[ $(git status | grep -q 'both modified') ]]; then
			git status
			read -p "Put the files to check >" files
		git checkout --theirs "$files"
			echo "Your $files read to the indexed"
				git add "$files"
fi

}

conf


