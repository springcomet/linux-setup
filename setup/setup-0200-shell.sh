#!/bin/bash
set -x
set -e



# shell stuff

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/Aloxaf/fzf-tab {ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

[[ -f ~/.zshrc ]] && cp ~/.zshrc ~/.zshrc_
ln -s ./dot/zshrc ~/.zshrc
ln -s ./dot/gitconfig ~/.gitconfig
#ln -s ~/aqua/dot/git.aliases ~/.git.aliases
# ln -s ~/aqua/dot/misc.aliases ~/.misc.aliases
# ln -s ~/aqua/dot/common.env ~/.common.env
