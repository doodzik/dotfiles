brew install youtube-dl
brew cask install vlc
brew cask install skype
brew cask install flux
brew cask install appcleaner
brew cask install anki

defaults write com.apple.finder CreateDesktop -bool FALSE
defaults write com.apple.screencapture location ~/Downloads

ln -s Library/Mobile\ Documents/com~apple~CloudDocs
mv com\~apple\~CloudDocs iCloud

echo "log into:\n"
echo "anki\n"
echo "skype\n"

killall SystemUIServer
killall Finder
