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
brew install nvm

git clone https://github.com/doodzik/dotfiles.git ~/

. $(brew --prefix nvm)/nvm.sh
nvm install iojs

while [[ $# > 0 ]]
do
  key="$1"

  case $key in
    -g|--gui)
      brew install caskroom/cask/brew-cask
      brew cask install mailbox
      brew cask install google-chrome
      brew cask install filezilla
      brew cask install skype
      shift # past argument
      ;;
    -d|--development)
      npm adduser doodzik
      shift # past argument
      ;;
  esac
  shift # past argument or value
done

# login into zsh
exec zsh -l
