#!/bin/bash

/usr/bin/echo "[?] Cargo setup"
if [[ -d $HOME/.cargo ]]; then
    /usr/bin/echo "[?] Cargo already installed, skipping..."
else
    /usr/bin/echo "[+] Installing Cargo"
    /usr/bin/curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

CARGO_BIN_PATH=$HOME/.cargo/bin

/usr/bin/echo "[+] Updating rustup"
$CARGO_BIN_PATH/rustup update

$CARGO_BIN_PATH/cargo install --locked \
    bat \
    exa \
    zoxide \
    fd-find \
    ripgrep \
    tealdeer

if [[ $(/usr/bin/uname -a) != *WSL* ]]; then
    $RUSTUP_BIN install feroxbuster --locked
fi
