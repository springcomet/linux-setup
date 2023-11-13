#!/bin/bash

# dev env

sudo apt install -y git
sudo snap install code --classic
sudo apt install -y zsh
sudo apt install -y curl
sudo apt install -y fzf
sudo apt install -y htop
sudo apt install -y xclip
sudo apt install -y jq
sudo apt install -y chrome-gnome-shell
sudo apt install -y autojump   # source /ust/share/autojump/autojump.zsh
sudo apt install -y mc
sudo apt install -y awscli
sudo apt install -y pavucontrol
sudo apt install -y fdfind
sudo apt install -y glogg # A fast, advanced log explorer. http://glogg.bonnefon.org/

sudo snap install yq



#wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
#nvm install 10.16.0
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#nvm use 10.16.0

#npm install -g yarn
#npm install -g yaml-import
#npm install -g @stoplight/spectral

# more tools
# dive https://github.com/wagoodman/dive
# crane https://github.com/google/go-containerregistry/releases
# 

# clipboard - https://hluk.github.io/CopyQ/ 
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
