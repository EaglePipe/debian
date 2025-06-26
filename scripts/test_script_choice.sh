#!/bin/bash

echo "#######################################################"
echo "                 Debian 12 XFCE Installer              "
echo "#######################################################"

# prompting for choice
read -p "Do you want to install base system now. (y)Yes/(n)No/(c)Cancel:- " choice

# giving choices there tasks using
case $choice in
[yY]* ) echo ">>> Installing XFCE Base System <<<" 
	sudo apt update
	sudo apt upgrade
	echo "#####################################################"
	echo "######### R E A D Y #################################"
	echo "#####################################################"

	;;
[nN]* ) echo "Thanks for using the script" ;;
[cC]* ) echo "Installation cancelled" ;;
*) 	echo "#####################################################"
	echo "######### EXIT      #################################"
	echo "#####################################################"


	exit ;;
esac
