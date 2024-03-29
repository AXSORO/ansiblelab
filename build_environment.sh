#!/bin/bash
echo "Environment created by AXSORO on GitHub."
echo "Using Docker-Compose to build environment."
echo
echo
docker-compose up -d --build
echo "Build Complete."
echo
echo
echo
echo
echo "Exec into master, run welcome script."
echo
echo
echo
echo
docker exec -it master /tmp/welcome.sh
docker exec -it master bash
