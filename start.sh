#!/bin/bash
#set -o verbose


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
