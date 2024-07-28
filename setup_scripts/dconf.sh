#!/bin/bash

echo "[?] Dconf setup"

if [[ -z $(command -v dconf) ]]; then
    echo "[?] Dconf not found, skipping setup..."
fi

dconf load /org/mate/terminal/profiles/default/ < ../configs/dconf-default-profile
