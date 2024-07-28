#!/bin/bash

/usr/bin/echo "[?] Neovim install"

SKIP_INSTALL=false

latest_version=$(/usr/bin/gh release -R neovim/neovim view | /usr/bin/head -1 | /usr/bin/sed "s/title:\s*Nvim\s//")
if [[ ! $(command -v nvim) ]]; then
    current_version=$(/usr/local/bin/nvim --version | /usr/bin/head -1 | /usr/bin/sed "s/NVIM\s//")
    SKIP_INSTALL=$(latest_version == current_version)
fi

if [[ ! $SKIP_INSTALL ]]; then
    /usr/bin/gh release download -R neovim/neovim -p nvim-linux64.tar.gz -D $HOME/Downloads
    /usr/bin/tar xzf $HOME/Downloads/nvim-linux64.tar.gz
    /usr/bin/sudo /usr/bin/mv $HOME/Downloads/nvim-linux64 /opt
fi

read -p "[?] Copy the files instead of symlink?: [y]es " input

[[ -d $HOME/.config ]] \
    || /usr/bin/mkdir $HOME/.config

NVIM_CONF_DIR=./configs/nvim
case $input in
    'y')
        /usr/bin/cp -br $NVIM_CONF_DIR $HOME/.config/ 2>/dev/null
    ;;
    
    *)
	    /usr/bin/ln -s $NVIM_CONF_DIR $HOME/.config/ 2>/dev/null
    ;;
esac

/usr/bin/sudo /usr/bin/ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
