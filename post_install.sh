#!/bin/bash
# Force script to be run as sudo
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root, use sudo ./"$0" instead" 1>&2
    exit 1
fi

# the list of software to be installed via package manager
SOFTWARE="vim git screenfetch"

# check the operating system
if [ -f /etc/os-release ]; then
    source /etc/os-release
    OS=$ID
else
    echo "ERROR: Not supported operating system."
    exit 1
fi

echo $OS

if [ "$OS" == "ubuntu" ] || [ "$OS" == "debian" ]; then
    PKGMAN="apt install -y"
elif [ "$OS" == "fedora" ] || [ "$OS" == "rhel" ]; then
    PKGMAN="dnf install -y"
else
    echo "ERROR: Not supported operating system."
    exit 1
fi

# DEBUG
echo $PKGMAN
# UNCOMMENT NEXT LINE WHEN COMPLETE
# $PKGMAN $SOFTWARE

