#!/bin/bash

/usr/bin/echo "[?] ZSH setup"
/usr/bin/sudo /usr/bin/apt install zsh

OMZ_HOME=$HOME/.oh-my-zsh

[[ -d $OMZ_HOME ]] \
    || /bin/sh -c "$(/usr/bin/wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

PLUGINS=(
    "romkatv/powerlevel10k;${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    "zsh-users/zsh-completions;${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions"
    "zsh-users/zsh-autosuggestions;${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions"
)

for (( i = 0; i < ${#PLUGINS[@]}; i++)); do
    plugin=${PLUGINS[$i]}
    IFS=";" read -r -a arr <<< "${plugin}"

    repo="${arr[0]}"
    location="${arr[1]}"

    /usr/bin/git clone --depth=1 "https://github.com/$repo" "$location"
done

/usr/bin/cp -b ./configs/.zshrc $HOME &
/usr/bin/cp -b ./configs/.p10k.zsh $HOME &
