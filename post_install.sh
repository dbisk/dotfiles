#!/bin/bash
# Force script to be run as sudo but keep the original user
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root, use sudo ./"$0" instead" 1>&2
    exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    echo "ERROR: Unable to get non-root user!"
    exit 1
fi

# the list of software to be installed via package manager
SOFTWARE="vim git screenfetch curl zsh firefox"

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
    if [ "$OS" == "debian" ]; then
        apt install -y snapd
        snap install core
    fi
    SNPCMD="snap install"

elif [ "$OS" == "fedora" ] || [ "$OS" == "rhel" ]; then
    PKGMAN="dnf install -y"
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
else
    echo "ERROR: Not supported operating system."
    exit 1
fi

# DEBUG
echo $PKGMAN
echo $real_user
# uncomment to install software
# $PKGMAN $SOFTWARE

# uncomment to install oh-my-zsh (TODO: check if this actually works)
# sudo -u $real_user sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# uncomment to install vscode (only on Ubuntu or Debian)
# $SNPCMD --classic code


