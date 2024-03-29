#!/bin/bash

# Print a message
echo "Welcome to my Ansible Lab!"
echo "This is currently a work in progress, check AXSORO/ansiblelab for updates and more information."
echo
echo
echo "Thank you to LMtx on GitHub for originally building out this environment. I have since made changes, as it looks like their project is no longer maintained."
echo "******************************"
echo "This build is not suitable for a production enviornment."

# Loop until the user types 'confirm'
while true; do
    # Prompt the user to type 'confirm'
    read -p "Please type 'confirm' and hit ENTER to proceed: " input

    # Check if the input matches 'confirm'
    if [ "$input" == "confirm" ]; then
        echo "Confirmed. Exiting the script and returning to bash..."
        echo
        echo
        echo "Run these commands to get started:"
        echo "ssh-agent bash"
        echo "ssh-add master_key (the password is 'password')"
        echo "Then you are all set! Currently there are 6 hosts and 3 groups as seen in the Inventory file at /var/ans/inventory"
        break # Exit the loop
    else
        echo "You typed it wrong, I think."
    fi
done

# After breaking out of the loop, the script ends, returning control to bash
