#!/bin/bash

/usr/bin/sudo /usr/bin/apt install zsh

CONFIGS_DIR=../configs
OMZ_HOME=$HOME/.oh-my-zsh

[[ -d $OMZ_HOME ]] \
    || /bin/sh -c "$(/usr/bin/wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

/usr/bin/git clone https://github.com/romkatv/powerlevel10k $OMZ_HOME/custom/themes &

/usr/bin/cp -b $CONFIGS_DIR/.zshrc $HOME
/usr/bin/cp -b $CONFIGS_DIR/.p10k.zsh $HOME
