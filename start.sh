#!/bin/bash
#set -o verbose

# Exit on failure
set -e

USER_MOUNTS_FOLDER="/user-mounts"


REQUIRED_PKG=sudo
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  ./install-sudo.sh
  exit 1
else
  echo "sudo ok"
fi



sudo apt update
sudo apt upgrade -y

echo "Install prerequisites"
sudo apt install wget apt-transport-https gnupg2 rsync -y

read -r -p "Install webmin? (Y/n): " USER_INPUT
if [[ "${USER_INPUT}" == "y" || "${USER_INPUT}" == "Y" || "${USER_INPUT}" == "" ]]; then
  ./install-webmin.sh
else
  echo "Skip installing webmin"
fi


