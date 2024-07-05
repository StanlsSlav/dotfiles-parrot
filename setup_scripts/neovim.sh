#!/bin/bash

sudo snap install nvim --classic
read -p "Copy the files instead of symlink?: [y]es " input

[[ -d $HOME/.config ]] \
    || mkdir $HOME/.config

NVIM_CONF_DIR=$PWD/../configs/nvim
case $input in
    'y')
        cp -br $NVIM_CONF_DIR $HOME/.config/ 2>/dev/null
    ;;
    
    *)
	ln -s $NVIM_CONF_DIR $HOME/.config/ 2>/dev/null
    ;;
esac
