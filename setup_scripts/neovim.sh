#!/bin/bash

echo "[?] Neovim install"

SKIP_INSTALL=false

latest_version=$(/usr/bin/gh release -R neovim/neovim view | /usr/bin/head -1 | /usr/bin/sed "s/title:\sNVIM\s//")
echo "$latest_version"

if [[ $(command -v nvim) ]]; then
    current_version=$(/usr/local/bin/nvim --version | /usr/bin/head -1 | /usr/bin/sed "s/NVIM\sv//")
    SKIP_INSTALL=$([[ latest_version == current_version ]])
fi

if [[ ! $SKIP_INSTALL ]]; then
    /usr/bin/gh release download -R neovim/neovim -p nvim-linux64.tar.gz -D /tmp
    /usr/bin/tar xzf /tmp/nvim-linux64.tar.gz -C /tmp

    /usr/bin/sudo /usr/bin/rm -rf /opt/nvim-linux64
    /usr/bin/sudo /usr/bin/mv /tmp/nvim-linux64 /opt
fi

read -p "[?] Copy the files instead of symlink?: [y]es " input

[[ -d $HOME/.config ]] \
    || /usr/bin/mkdir $HOME/.config

NVIM_CONF_DIR=$PWD/configs/nvim
case $input in
    'y')
        /usr/bin/cp -ur $NVIM_CONF_DIR $HOME/.config/
    ;;

    *)
        /usr/bin/ln -s $NVIM_CONF_DIR $HOME/.config/
    ;;
esac

/usr/bin/sudo /usr/bin/ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
