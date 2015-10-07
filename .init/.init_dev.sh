brew install mongodb
# echo in red
tput setaf 1
echo "setting git config;; change if you arn't frederik"
# stop echoing in red
tput sgr0
git config --global user.name "Frederik Dudzik"
git config --global user.email frederik.dudzik@gmail.com 
git config --global push.default simple
git config --global credential.helper osxkeychain
ssh-keygen -t rsa -b 4096 -C "frederik.dudzik@gmail.com" 
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa 
pbcopy < ~/.ssh/id_rsa.pub
echo 'copied key to clipboard. opening github settings.'
echo 'Press [Enter] key when added key to github'
sleep 2
open https://github.com/settings/ssh
read -p ''
echo "npm"
npm adduser doodzik
