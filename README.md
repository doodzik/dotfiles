## reset

* While booting press Cmd+R
* Click on Disk Utility
* Select the startup drive(Macintosh HD)
* switch to the Erase tab and choose Mac OS Extended (Journaled) from the Format drop-down menu. 
* Select Erase
* Quit out of the Disk Utility app
* Click on Reinstall OS X
* run basic/gui/dev script in CLI 

## basic/gui/dev script
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/dotfiles/master/.init/.init.sh)

## basic script
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/dotfiles/master/.init/.init_basic.sh)

## dev script
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/dotfiles/master/.init/.init_dev.sh)

## gui script
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/dotfiles/master/.init/.init_gui.sh)
