#!/bin/bash
set -x
set -e

sudo apt install -y gnome-shell-extension-manager
sudo apt install -y gnome-shell-extensions
sudo apt install -y chrome-gnome-shell
sudo apt install -y gnome-tweaks

cd ~/.local/share/gnome-shell/extensions/
git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git clipboard-indicator@tudmotu.com
https://github.com/Coda-Coda/argos.git git clone https://github.com/rammie/argos.git 
git clone https://github.com/bjarosze/gnome-bluetooth-quick-connect
https://github.com/hackermare/media-controls/releases/download/v21/extension.zipgzip 

sudo apt install -y glogg # A fast, advanced log explorer. http://glogg.bonnefon.org/
sudo apt install -y pavucontrol


# clipboard - https://hluk.github.io/CopyQ/ 
#sudo add-apt-repository ppa:hluk/copyq
#sudo apt update
#sudo apt install copyq
