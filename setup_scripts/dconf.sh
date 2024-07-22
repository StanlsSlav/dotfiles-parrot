#!/bin/bash

echo "[?] Dconf setup"
dconf load /org/mate/terminal/profiles/default/ < ../configs/dconf-default-profile

