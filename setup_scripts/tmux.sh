#!/bin/bash

/usr/bin/echo "[?] TMUX setup"

/usr/bin/sudo /usr/bin/apt install -y tmux

/usr/bin/cp -u ./configs/.tmux.conf $HOME

tpm_dir=($HOME/.tmux/plugins/tpm)
if [[ -d $tpm_dir ]]; then
    /usr/bin/echo "[?] Skipping TPM install"
else
    /usr/bin/echo "[+] Installing TPM"
    /usr/bin/git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

/usr/bin/echo "[?] Install the plugins via Leader+I"
