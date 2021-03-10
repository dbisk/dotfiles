#!/bin/bash
# Force script to be run as sudo
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root, use sudo ./"$0" instead" 1>&2
	exit 1
fi

SOFTWARE="vim git screenfetch"

# check the operating system
if [ -f /etc/os-release ]; then
	source /etc/os-release
	OS=$NAME
else
	echo "ERROR: Not supported operating system."
	exit 1
fi

echo $OS

if [ $OS == "Ubuntu" ]; then
	INSTALLCMD="apt install -y"
fi

$INSTALLCMD $SOFTWARE
