#!/bin/bash
set -x
set -e

sudo apt install -y gnome-shell-extension-manager
sudo apt install -y gnome-shell-extensions
sudo apt install -y chrome-gnome-shell
sudo apt install -y gnome-tweaks

#cd ~/.local/share/gnome-shell/extensions/
#git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git clipboard-indicator@tudmotu.com
#https://github.com/Coda-Coda/argos.git git clone https://github.com/rammie/argos.git 
#git clone https://github.com/bjarosze/gnome-bluetooth-quick-connect
#https://github.com/hackermare/media-controls/releases/download/v21/extension.zipgzip 


# shell stuff

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

[[ -f ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc_
ln -s ~/aqua/dot/zshrc ~/.zshrc
ln -s ~/aqua/config/.gitconfig ~/.gitconfig
ln -s ~/aqua/dot/git.aliases ~/.git.aliases
ln -s ~/aqua/dot/misc.aliases ~/.misc.aliases
ln -s ~/aqua/dot/common.env ~/.common.env
