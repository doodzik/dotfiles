#!/usr/bin/env bash

bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/dotfiles/master/.init/.init_basic.sh)

./.init_dev.sh
./.init_gui.sh

exit 0
