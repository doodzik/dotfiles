brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install mailbox
brew cask install vlc
brew cask install filezilla
brew cask install skype
brew cask install flux
brew cask install slack
brew cask install appcleaner
brew cask install anki
brew install youtube-dl

defaults write com.apple.finder CreateDesktop -bool FALSE

ln -s Library/Mobile\ Documents/com~apple~CloudDocs
mv com\~apple\~CloudDocs iCloud

# TODO print each service to log into
