#!/bin/bash
set -euo pipefail

<<<<<<< HEAD
1lb () {
=======
lb () {
>>>>>>> 7aeb3a3 (Still going, a few days to docker)
	echo "Showing the local branches in your dir"
		git branch 
}

<<<<<<< HEAD
2dl () {
=======
dl () {
>>>>>>> 7aeb3a3 (Still going, a few days to docker)
	echo "Showing your merged branches"
		git branch --merged 
	read -p "What branch do you want to delete? > " branch
		read -p "Press enter to delete..."
		timer
	git branch -d "$branch"
		echo "Your $branch were deleted"		
}

<<<<<<< HEAD
3rm () {
=======
prune_cleaner () {
>>>>>>> 7aeb3a3 (Still going, a few days to docker)
	echo "Showing remote branches"
		git branch -r
	read -p "Do you want to clean remote branch? [y/n] > " opt
case $opt in
	y|yes) echo "Cleaning remote branches"
		read -p "Press enter to clean..."
			timer
		git remote prune origin
			echo "Your remote branch were clean"
				exit 0
		;;
	n|no) echo "Exiting"
		exit 0
		;;
	/?)
		echo "Error, put the answer" >&2
			exit 1
			;;
	esac
}




timer () {
	for i in {5..1}; do
		echo "Count: $i "
	sleep 1
done 		

}

while true; do
clear
cat <<EOF
	1. See all local branches
	2. Delete merged branches
	3. Show remote branches and
	   Clean remote branches
	4. exit
EOF

read -p "Choose the optiont > " opt

case $opt in

	1) 
<<<<<<< HEAD
		1lb "$@"
		;;
	2)
		2dl "$@"
			trap 2dl SIGINT
		;;
	3)
		3rm "$@"
			trap 3rm SIGNIT
=======
		lb "$@"
		;;
	2)
		dl "$@"
			trap 2dl SIGINT
		;;
	3)
		prune_cleaner "$@"
			trap 3rm SIGINT
>>>>>>> 7aeb3a3 (Still going, a few days to docker)
		;;
	4)
		exit 0

esac
done
