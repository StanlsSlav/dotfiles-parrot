#!/bin/bash

apt install zsh

CONFIGS_DIR = ../configs
OMZ_HOME = $HOME/.oh-my-zsh

[[ -z test $OMZ_HOME ]]
    || sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/romkatv/powerlevel10k $OMZ_HOME/custom/themes &

cp -b $CONFIGS_DIR/.zshrc $HOME
cp -b $CONFIGS_DIR/.p10k.zsh $HOME
