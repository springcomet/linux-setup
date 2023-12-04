#!/bin/bash
set -x
set -e



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
