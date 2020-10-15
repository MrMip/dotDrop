#!/bin/bash 

cd ~/.config/
git clone https://github.com/mrmip/dwm.git
git clone https://github.com/mrmip/dmenu.git

cd .config/dwm
sudo make install

cd ..
cd dmenu
sudo make install

cd
