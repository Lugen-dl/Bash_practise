#!/bin/bash

set -eou pipefail

while true; do
cat <<EOF
	1. Turn on docker
	2. Turn on/off Autoboot docker
	3. Check Docker status
	4. Pull/Run image
	5. exit
EOF

read -p "Choose the option > " opt
	case $opt in
	
	1)
		echo "====Starting docker===="
		docker context use default
			sudo systemctl start docker
		echo "You can work with docker now"
				;;
	2)
		read -p "Type what do you want to do [on/off] > " answ
			if [[ "$answ" == "on" ]]; then
				sudo systemctl enable docker.service
					echo "Your auto load enable"
						return 0
			elif [[ "$answ" == "off" ]]; then
				sudo systemctl disable docker.service
					echo "Your auto load disable"
						return 0
			fi
				;;
	3)
		echo "====Checking docker status===="
			sudo systemctl status docker
				sleep 5
					clear
				;;
	4)
		read -p "put the flag -p ((pull image)); -r ((run image)) + Image name > " user_input
			
		user_output () {
			local OPTIND	
				while getopts ":p:r" opt "$@"; do
			case ${opt} in
				p)
							docker image pull "$OPTARG"
								echo "Your image was pulled"
									exit 0
							;;
				r)
					echo "===Running your image==="
						docker container run -it "$OPTARG"
								echo "Your image running now"
									exit 0
							;;
				\?)
					echo "Wrong arguments -$OPTARG"
							;;
				esac	
					done
				}

		user_output $user_input
				;;
	5) 	clear
			exit 0
			
				;;
	


esac
done	
