#!/bin/bash

i=$(ls)
path="$HOME/shebang/*"

(
clear
while true; do

echo "	---My best file manager---
	1. Show the files in folder
	2. Create a file
	3. Delete the file
	4. Name existing file
	5. Exit
"


read -p "choose your option [1-5] > " OPTION

case "$OPTION" in
1) 
echo "Files in your folder"	
		ls $path
sleep 5
	clear
	;;
2)
echo "Creating a file"
		touch "file.txt"
sleep 5
	clear
	;;
3)
echo "Remove file that you want from your folder"
		read -r -p "$i
Enter the name > " filename
	if [[ -f "$filename"  ]]; then
		rm "$filename"
	echo "Your $filename was deleted"
		fi
sleep 5
	clear
	;;
4)
echo "Rename the file you want" 
		read -r -p "$i
Enter the name > " file
		read -r -p " 
Enter the new name for file > " newname
	if [[ -f "$file" ]]; then
		mv $file $newname
	echo "your file was renamed into $newname"
		fi
sleep 5
	clear
	;;
5)
echo "Exiting the choice"
	exit
	exit 1 	
esac
done	
) | tee 2>&1 "txt.log"
