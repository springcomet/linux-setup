#!/bin/env bash

install_path=~/.local/bin
mkdir -p ${install_path}

CURRENT_VERSION=$(curl -Ls https://api.github.com/repos/Versent/saml2aws/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1)
wget -c https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -O - | tar -xzv -C ${install_path}
chmod u+x ${install_path}/saml2aws
hash -r
saml2aws --version