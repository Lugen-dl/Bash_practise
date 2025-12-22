#!/bin/bash
set -euo pipefail

while true; do
cat <<EOF
	1.Cancel last commit
	2.Cancel last changes in file
	3.Cancel all uncommited changes
	4.Get back to one of your commit
EOF

read -p "Choose the option > " opt
	case $opt in
	1)
		read -p "Press <enter> to reset commits.."
		git reset --soft HEAD~1
			git reflog #Showing what was reseted
			;;
	2)
		git status
			read -p "Choose the file with changes you want to cancel > " file
		git checkout "$file"
			;;
	3)
		read -p "Press <enter> to reset all commits..."
				read -p "Are you sure [y/n] " answ
		if [[ "$answ" == "y" ]]; then
			git reset --hard
		elif [[ "$answ" == "n" ]]; then
			exit 0 
		fi
			;;
	4)
		git log --oneline -10
			read -p "Put the commit name you want to get back > " name
				git revert $name
			;;
esac
done
