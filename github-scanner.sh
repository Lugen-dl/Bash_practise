#!/bin/bash

USERNAME="Lugen-dl"

echo "Fetching repos for $USERNAME"

curl -s "https://api.github.com/users/Lugen-dl/repos" | \
	grep -o '"name": "[^"]*"' | \
	cut -d '"' -f4

echo ""
echo "Done!"
