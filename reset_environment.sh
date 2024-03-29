#!/bin/bash
read -p "This will purge ansiblelab from your Docker environment. Are you sure? (y/n): " answer

answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "$answer" == "y" ]; then
    docker-compose kill
    docker-compose rm -f
    docker volume rm ansiblelab_ansible_vol
    docker rmi ansible_host ansible_master ansible_base
    echo "Docker Environment Purged."
elif [ "$answer" == "n" ]; then
    echo "Operation cancelled. No changes have been made to Docker."
else
    echo "Invalid response. No changes have been made to Docker."
fi
