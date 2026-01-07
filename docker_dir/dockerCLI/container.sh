#!/bin/bash

set -eou pipefail


fl_err () {
    if [[ -n $(docker image ls $opt1 2>/dev/null) ]]; then
      echo "Image exists localy"
        sleep 2
          echo "Running your image"
            docker container run $name
    else
      echo "Image does not exist."
        read -p "Do you want to download image and run container? [y/n]" OUTPUT
          if [[ "$OUTPUT" == "y" ]]; then
          docker image pull "$opt1"
          elif [[ "$OUTPUT" == "n" ]]; then
                exit 1 
        fi
    fi
      }

err () {
  if [[ -z $opt  || ! "$opt" =~ "^[1-9]+$" ]]; then
    echo "Error, try again"
      return
  fi    
}

flag_ch () {
  if [[ $d_flag == "1" && "$i_flag" == "1" ]]; then
    echo "Cannot use those flags together" >&2
      exit 1
  fi
}

container () {
cat <<EOF
  1. Run container with flags.
EOF
#Your err function
err

read -p "Choose the option > " opt
case $opt in
#First Option with getopts
  1)

    docker container ls
      read -p "Put the name of the image and flag. > " opt1

    #Checking if there is any images to run your container, 
    #if not exit or download and run
      flag_err
    
      #Adding arguments for flag compatability
        d_flag=0
        i_flag=0
        
    while getopts "i:e:r:d" opt1; do
    case $opt1 in
      d)
        d_flag=1
        cont_img=$OPTARG
        ;;
      i)
        i_flag=1
        cont_img=$OPTARG
        ;;
      e)
      docker container exec $OPTARG /bin/bash
        ;;
      r)
        read -p "Delet container $OPTARG [y/n]? " answ
        [[ "$answ" == "y" ]] && docker container rm -f $OPTARG  
        ;;
      \?) echo "Unknown flag" >&2
          exit 1
    esac
  done
      #Checking flags have their compatability, if not, Error.
    flag_ch "$@"
      #Checking if arguments that we give actually equals, if not, Error.
    if [[ $i_flag -eq 1 ]]; then
      docker container run -it "$container_img"
        elif [[ $d_flag -eq 1 ]]; then
          docker container run -d "$container_img"
    fi
        ;;
esac
}
