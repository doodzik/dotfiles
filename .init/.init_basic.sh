#!/usr/bin/env bash

# install homebrew
command -v brew >/dev/null 2>&1 || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install dotfiles
brew install vim
brew install git
brew install nvm
brew install selecta

# setup node
mkdir ~/.nvm
. $(brew --prefix nvm)/nvm.sh
nvm use 4
nvm alias default 4

# no blurry font
defaults write com.apple.Terminal AppleFontSmoothing -int 0

# install ohmyzsh
command -v zsh >/dev/null 2>&1 || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm .zshrc

# setup repo for dotfiles
git init
git remote add origin https://github.com/doodzik/dotfiles.git
git fetch
git checkout -t origin/master
git submodule update --init --recursive

open .dudzik.terminal
