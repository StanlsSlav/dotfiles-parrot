#!/bin/bash

/usr/bin/echo "[?] ZSH setup"
/usr/bin/sudo /usr/bin/apt install zsh

CONFIGS_DIR=../configs
OMZ_HOME=$HOME/.oh-my-zsh

[[ -d $OMZ_HOME ]] \
    || /bin/sh -c "$(/usr/bin/wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

/usr/bin/git clone git:romkatv/powerlevel10k $OMZ_HOME/custom/themes/powerlevel10k
/usr/bin/git clone git:zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

/usr/bin/cp -b $CONFIGS_DIR/.zshrc $HOME &
/usr/bin/cp -b $CONFIGS_DIR/.p10k.zsh $HOME &
