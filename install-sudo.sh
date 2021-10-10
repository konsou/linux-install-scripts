#!/bin/bash
#set -o verbose

SCRIPT=`realpath $0`
echo "Running ${SCRIPT}"

#USER_GROUP="${USER}:$(id -gn $USER)"
echo "You are: ${USER}"
echo "First argument is: ${1}"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  echo "Please enter your root password below."
  su --preserve-environment --command "${SCRIPT} ${USER}" root
  exit 1
fi

echo "You're root, nice!"
echo "Installing sudo"
apt update
apt install sudo -y

echo "Adding ${1} to sudoers"
/sbin/adduser "${1}" sudo

echo "Done."

echo "Run \"newgrp sudo\" and \"./start.sh\" to continue"

