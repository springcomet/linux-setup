#!/bin/bash

# docker stuff

# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# more tools
# dive https://github.com/wagoodman/dive
#
#
# crane https://github.com/google/go-containerregistry/releases
# crane completion zsh > "${fpath[1]}/_crane"

# need to restart for this to take affect
sudo usermod -a -G docker ${USER}

sudo snap install kontena-lens --classic
