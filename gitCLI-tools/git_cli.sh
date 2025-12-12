#!/bin/bash

while true; do
    clear
    echo "=== Git Helper ==="
    echo "1. Status"
    echo "2. Commit"
    echo "3. Push"
    echo "4. Log (last 5)"
    echo "5. Exit"
    
    read -p "Choose [1-5] > " choice
    
    case $choice in
        1) 
            git status
            read -p "Press Enter to continue..."
            ;;
        2)
	    git status	
		read -p "Commit all changes? [y/n] > " confirm
    if [ "$confirm" = "y" ]; then
		read -p "Commit message > " message
        git add .
        git commit -m "$message"
    fi
    	read -p "Press Enter..."
    ;;
	3)

	git status
		read -p "Push your commit files? [y/n] > " sure
	if [ "$sure" = "y" ]; then
		ls
		read -p "Transporting your push files > "
		git push origin main
	fi
		read -p "Press Enter..."
;;
	4)
	git status
	git log --oneline -5
	read -p "Press Enter to continue..."
;;		
	5)
	exit 1
	
;;		
    esac
done
