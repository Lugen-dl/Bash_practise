#!/bin/bash

set -eou pipefail
trap 'echo "Error at line $LINENO"; exit 1' ERR

#Your image function
source ./image.sh
#Your container function
source ./container.sh


#Checking the loggin to the Docker hub
logger () {
echo "Please log to your docker hub to continue"
  if ! docker login; then
    echo "Error, exiting the script"
      exit 1
  fi
    }
logger

#If succesful, going to the choice menu
cat <<EOF
  0. Exit
  1. Image working
  2. Container working
  3. Image building and containerization
EOF
    
read -p "Choose the option > " opt
#Checking the $opt correctly
  if [[ -z "$opt" || ! "$opt" =~ ^[0-9]+$ ]]; then
    echo "Error, wrong format"
      exit 1
  fi

#Main Function  
  case $opt in
      0) echo "Exiting the script"
          exit 0
        ;;
      1) 
        image
        ;;
      2)
        container
        ;;
      3)
        build

esac
    
  
