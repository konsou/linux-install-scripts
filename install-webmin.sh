#!/bin/bash

echo "Start install webmin"

echo "Add repository"
REPO="deb https://download.webmin.com/download/repository sarge contrib"
SOURCES_LIST="/etc/apt/sources.list"
if [[ -z $(grep "${REPO}" "${SOURCES_LIST}") ]]; then
  echo "Repo ${REPO} not found in ${SOURCES_LIST}, adding"
  echo "deb https://download.webmin.com/download/repository sarge contrib" | sudo tee --append "${SOURCES_LIST}" > /dev/null
else
  echo "Repo ${REPO} found in ${SOURCES_LIST}, not adding"
fi

echo "Download and add signing key"
wget https://download.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
rm jcameron-key.asc

# prerequisites installed by start.sh
# sudo apt install apt-transport-https
sudo apt update
sudo apt install webmin -y

