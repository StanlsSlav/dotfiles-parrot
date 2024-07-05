#!/bin/bash

apt install -y tmux

cp -b ../configs/.tmux.conf ~/.tmux.conf
cp ../configs/files/.checktun0 ~/.checktun0

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Install the plugins via Leader+I"
