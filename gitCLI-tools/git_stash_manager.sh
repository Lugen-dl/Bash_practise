#!/bin/bash

#Creating interactive manager 
show_menu() {
	clear
cat <<EOF
	1. Save changes to stash
	2. List all stashes
	3. Apply stash
	4. Delete stash
	5. Show stash content
EOF
}

apply_stash() {
	if [ $(git stash list | wc -l) -eq 0 ]; then
		echo "No stashes available!"
		return
	fi
	
	git stash list
	read -p "Stash number > " num
	
	if git stash apply "stash@{$num}" 2>/dev/null; then
		echo "Applied successfully"
	else
		echo "Error: Invalid stash number"
	fi 
}

while true; do
	show_menu
read -p "Choose the option [1-5] > " opt

case $opt in
		
	1)
		echo "Write the message in your stash"
		read message
	git stash push -m "$message"
		echo "Your stash has been saved"
			;;
	2)
		echo "Showing your stashes"
		git shash list || echo "No stashes"
			;;
	3)
		apply_stash
			;;
	4)
		echo "Put the number to delete your stash"
		read num2
		git stash drop "stash@{$num2}" && echo "Deleted" 
			;;
	5)
		echo "Show stash content"
		read num3
		git stash show stash@{$num3} 

	esac
	read -p "Press enter to continue..."
done		
	
