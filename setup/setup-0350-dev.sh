#!/bin/env bash
set -e
set -x


go_v=1.19
mkdir -p ~/go/${go_v}
wget -O ~/Downloads/go${go_v}.linux-amd64.tar.gz https://go.dev/dl/go${go_v}.linux-amd64.tar.gz 
tar -C ~/go/${go_v} -xzf ~/Downloads/go${go_v}.linux-amd64.tar.gz
ln -s ~/go/default/ ~/go/${go_v}/go

# jetbrain goland
mkdir -p ~/Apps
sudo apt install libfuse2
jetbrain_tb_v=1.25.12627
wget -O ~/Downloads/jetbrains-toolbox-${jetbrain_tb_v}.tar.gz \
    https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-${jetbrain_tb_v}.tar.gz
tar -C ~/Apps -xzf ~/Downloads/jetbrains-toolbox-${jetbrain_tb_v}.tar.gz
~/Apps/jetbrains-toolbox-${jetbrain_tb_v}/jetbrains-toolbox&
# for now install manually using toolbox 
#GOROOT=~/go/${go_v}/go sudo snap install goland --classic



wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 10.16.0
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 10.16.0

npm install -g yarn
npm install -g yaml-import
npm install -g @stoplight/spectral
