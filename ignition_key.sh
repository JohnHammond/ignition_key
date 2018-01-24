#!/bin/bash

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo "${RED}${1}${NC}"
}
function GREEN(){
	echo "${GREEN}${1}${NC}"
}
function YELLOW(){
	echo "${YELLOW}${1}${NC}"
}
function BLUE(){
	echo "${BLUE}${1}${NC}"
}

# Testing if root...
if [ $UID -ne 0 ]
then
	RED "You must run this script as root!"
	exit
fi



BLUE "Updating repositories..."
sudo apt update

BLUE "Installing git..."
sudo apt install -y git

BLUE "Installing Sublime Text..." # according to https://www.sublimetext.com/docs/3/linux_repositories.html-
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

BLUE "Installing terminator..."
sudo apt install -y terminator

BLUE "Setting terminator as the default terminal emulator..."
sed -i s/Exec=gnome-terminal/Exec=terminator/g /usr/share/applications/gnome-terminal.desktop

