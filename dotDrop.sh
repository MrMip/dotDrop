#!/bin/bash 

#Settings
AURHELPER="yay"
GITUSERNAME="MrMip"
REPOS=(dotfiles dwm)

echo "Installing Packages"
sudo pacman -S --needed - < pagklist

echo "Installing AUR Helper"
git clone https://aur.archlinux.org/$AURHELPER.git
cd yay
makepkg -si
cd .. && rm -rf yay
echo "Installing AUR Packages"
sudo yay -S --needed - < aurpagklist

echo "Cloneing Repo(s)"
cd ~
i=0
while [ $i <= ${REPOS[@]} ]; do
    git clone https://github.com/$GITUSERNAME/${REPOS[$i]}.git
    $i=$(expr $i + 1)  
done

