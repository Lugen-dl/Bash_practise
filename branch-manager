#!/bin/bash

while true; do
cat <<EOF
	1.Show all branches
	2. Create new branch
	3. Change to other branch
	4. Delete branch (with agreement)
	5. Merge branches in main
	0. exit
EOF



read -p "Choose the option [0-5] > " option

case $option in
	
	1)	#Showing main branches
		git status
		sleep 3
			clear
		;;
	2)	
		#Creating new branch
		read -p "Put the name of your new branch >" name
			git branch $name
		if [ -z $name ]; then
			echo "Your brunch didn't created"
			exit 1
		else
			read -p "It's all good, press <Enter> to continue..."
				clear
			fi
				
		;;
	3)	
		#Changing to the new created branch
		git branch
		read -p "Put the name of the branch you want to change >" branch
			git switch $branch
				echo "You have been succesfully changed. Press <Enter> to continue..."
					clear
		;;
	4)
		#Deleting branch with agreement
		git branch
		read -p "Choose the branch your want to delete > " delete
					read -p "Are you sure you want to delete this $delete branch? [y/n] > " -n 1 -r
				if [[ $REPLY =~ '^[Yy]$' ]]; then
					git branch -d $delete
				else
					echo "Deletion was aborted"
				fi
					clear
		;;
	5)
		#Merge branches in main
			git merge origin/main
		echo "Merging completed"
			sleep 2
				clear
		;;
	0) 	
		#Exiting
		echo "Bye :)"
				sleep 1
			clear 
			exit 1
				
esac
	done

