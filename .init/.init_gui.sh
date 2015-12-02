brew install youtube-dl
brew install caskroom/cask/brew-cask
brew cask install vlc
brew cask install skype
brew cask install flux
brew cask install appcleaner
brew cask install anki

defaults write com.apple.finder CreateDesktop -bool FALSE

ln -s Library/Mobile\ Documents/com~apple~CloudDocs
mv com\~apple\~CloudDocs iCloud

# TODO print each service to log into
echo "log into:\n"
echo "anki\n"
echo "skype\n"
