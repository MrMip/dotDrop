#!/bin/bash 

PROFILE="artix-main"

#Vars
DISTRO=$(cat $PROFILE/distro)
if [ $DISTRO = "arch" ]; then
    AURHELPER=$(cat $PROFILE/aurhelper)
    PKG="pacman"
    ARCH=true
else
    ARCH=false
fi
DOTFILEREPO=$(cat $PROFILE/dotfilerepo)

echo "Installing Packages"
if [ $ARCH ];then
    sudo pacman -S --needed - < pagklist
else
    echo "Your distro is not yet supported, or you have a typo who knows?"

if [ $ARCH ]; then
    echo "Installing AUR Helper"
    git clone https://aur.archlinux.org/$AURHELPER.git
    cd yay
    makepkg -si
    cd .. && rm -rf yay
    echo "Installing AUR Packages"
    sudo $AURHELPER -S --needed - < aurpagklist
fi

echo "Cloneing Dotfiles"
cd ~
git clone $DOTFILEREPO

echo "Starting Postrunscript"
chmod +x $PROFILE/postrunscript.sh
exec $PROFILE/postrunscript.sh
