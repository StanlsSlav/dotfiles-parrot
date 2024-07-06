#!/bin/bash

/usr/bin/gh release download -R neovim/neovim -p nvim-linux64.tar.gz -D $HOME/Downloads
/usr/bin/tar xzf $HOME/Downloads/nvim-linux64.tar.gz
/usr/bin/sudo /usr/bin/mv $HOME/Downloads/nvim-linux64 /opt

/usr/bin/read -p "Copy the files instead of symlink?: [y]es " input

[[ -d $HOME/.config ]] \
    || /usr/bin/mkdir $HOME/.config

NVIM_CONF_DIR=$PWD/../configs/nvim
case $input in
    'y')
        /usr/bin/cp -br $NVIM_CONF_DIR $HOME/.config/ 2>/dev/null
    ;;
    
    *)
	/usr/bin/ln -s $NVIM_CONF_DIR $HOME/.config/ 2>/dev/null
    ;;
esac

/usr/bin/sudo /usr/bin/ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
