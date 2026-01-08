#!/bin/bash

read -p "Press <Enter> to see branch..."
  git branch
    read -p "Put the name to see info about it > " name
      if [ -z "$name" ] &&
      [[ "$name" =~ '[0-9@#%_+-]' ]]; then
          echo "Error"
            exit 1
      fi      
            
        echo "Showing commit number in $name"
          git rev-list --count "$name"
            sleep 2
        echo "Showing the last commit "
          git log -n 1 
            sleep 2
        echo "Show repo status"
          git status

      
