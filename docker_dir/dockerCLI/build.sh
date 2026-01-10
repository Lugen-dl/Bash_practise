#!/bin/bash

build () {
  PATH_B=""  
  NAME=""
  FLAG=""
    read -p "put the name and tag for your Docker image > " name
      NAME="$name"
    read -p "put the path of your Dockerfile to build > " path
      if [[ -z "$path" ]] ||  [[ ! "$path" =~ ^[a-zA-z0-9]+$ ]]; then
        echo "Error, empty or incorrect string" 2>/dev/null
          return
      else
        #Giving PATH_B your input path
          PATH_B="$path"
        read -p "Add the flag option > " flag
      if [[ -z "$flag" || "$flag" =~ ! ^[a-zA-z]+$  ]]; then
        echo "Error, empty or incorrect string" 2>/dev/null
          return
      else
        #Giving FLAG your input flag
          FLAG="$flag"
        docker build "$flag" "$NAME" "$PATH_B"
          echo "Your $NAME was created"
            docker image ls "$NAME"
              return 0

  fi          
fi
}
