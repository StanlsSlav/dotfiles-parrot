#!/bin/bash

[[ -d $HOME/.cargo ]] \
    || /usr/bin/curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

CARGO_BIN_PATH=$HOME/.cargo/bin
$CARGO_BIN_PATH/rustup update

$CARGO_BIN_PATH/cargo install --locked \
    bat \
    exa \
    zoxide \
    fd-find \
    ripgrep \
    tealdeer

if [[ $(uname -a) != *"WSL"* ]]; then
    $RUSTUP_BIN install feroxbuster --locked
fi
