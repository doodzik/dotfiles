#!/usr/bin/env bash

xcode-select --install
read -p 'Press [Enter] key when you installed xcode'

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install dotfiles
brew install vim
brew install git
git clone https://github.com/doodzik/dotfiles.git ~/

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

# login into zsh
exec zsh -l
