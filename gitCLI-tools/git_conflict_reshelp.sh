#!/bin/bash

#Hooks of my dir and git dir
MY_HOOKS="$HOME/git-test/hook_dir/"
GIT_HOOKS="$HOME/git-test/.git/hooks/"

#Checking if dirs exists
if [[ ! -d "$MY_HOOKS" ]]; then
	echo "Error, no dir exists."
		exit 1
elif [[ ! -d "$GIT_HOOKS" ]]; then
	echo "Error, no dir exists."
		exit 2
fi

echo "Install Hooks from my dir and git dir."

#Assign the value to hook_script $MY_HOOK
for hook_script in "$MY_HOOKS"/*; do
#Checking. If it's a file, then, we exctracting main .sh by removing leading with "basename"
	if [ -f "$hook_script" ]; then
		hook_name=$(basename "$hook_script" .sh)
        target_path="$GIT_HOOKS/$hook_name"

	cp "$hook_script" "$target_path"

	chmod +x "$target_path"
        echo "Installed and made executable: $hook_name"
    fi
done

echo "Hooks were installed"

