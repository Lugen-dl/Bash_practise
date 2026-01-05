#!/bin/bash
set -eou pipefail

image () {
  while true; do
  cat <<EOF
  1. Search for the official images
  2. Pull the image or delete
EOF
  read -p "Choose > " opt1
case $opt1 in
  1)
    read -p "put the image you want to search " image
      docker search "$image" --filter is-official=true
        read -p "Press <enter> to return..."
            ;;
  2)
    read -p "Put the name > " name
      read -p "Put the tag > " tag
        full="$name:$tag"
          read -p "Do you want to pull or delete? [p/d]" answ
      if [[ "$answ" == "p" ]]; then
          docker image pull "$full"
            echo "Your $full was pulled"
              exit 0
      elif [[ "$answ" == "d" ]]; then
          if ! docker container stop "$full"; then
            echo "Error, cannot remove image with it working container!"
              exit 1
            else  
          docker image rm "$full"
          fi
      fi    
esac
done
}

