brew install youtube-dl

echo "installing gui..."

guis=(
  vlc
  skype
  flux
  appcleaner
  anki
)

brew cask install ${guis[@]}

echo "log into:\n"
echo "anki\n"
echo "skype\n"

# disable desktop
defaults write com.apple.finder CreateDesktop -bool FALSE
# change screenshot folder
defaults write com.apple.screencapture location ~/Downloads
# symlink iCloud Folder to ~/
ln -s Library/Mobile\ Documents/com~apple~CloudDocs
mv com\~apple\~CloudDocs iCloud

# restart
killall SystemUIServer
killall Finder
