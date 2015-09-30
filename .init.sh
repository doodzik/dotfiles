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
nvm install 4

while [[ $# > 0 ]]
do
  key="$1"

  case $key in
    -g|--gui)
      brew install caskroom/cask/brew-cask
      brew cask install google-chrome
      brew cask install google-drive
      brew cask install mailbox
      brew cask install filezilla
      brew cask install skype
      brew cask install flux
      brew cask install slack
      brew cask install appcleaner
      brew cask install anki
      open -a "Google Chrome" --args --make-default-browser
      shift # past argument
      ;;
    -d|--development)
      brew install mongodb
      npm adduser doodzik
      ssh-keygen -t rsa -b 4096 -C "frederik.dudzik@gmail.com" 
      eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa 
      pbcopy < ~/.ssh/id_rsa.pub
      echo 'copied key to clipboard. opening github settings.'
      echo 'Press [Enter] key when added key to github'
      sleep 2
      open https://github.com/settings/ssh
      read -p ''
      shift # past argument
      ;;
  esac
  shift # past argument or value
done

# login into zsh
exec zsh -l
