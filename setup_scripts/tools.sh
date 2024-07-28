#!/bin/bash

/usr/bin/echo "[?] Tools install"

if [[ ! $(command -v gh) ]]; then
    /usr/bin/echo "[?] GH CLI not found, installing..."
    (type -p wget >/dev/null || (/usr/bin/sudo /usr/bin/apt update && /usr/bin/sudo /usr/bin/apt-get install wget -y)) \
        && /usr/bin/sudo /usr/bin/mkdir -p -m 755 /etc/apt/keyrings \
        && /usr/bin/wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | /usr/bin/sudo /usr/bin/tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
        && /usr/bin/sudo /usr/bin/chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
        && /usr/bin/echo "deb [arch=$(/usr/bin/dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
        && /usr/bin/sudo /usr/bin/apt update \
        && /usr/bin/sudo /usr/bin/apt install gh -y
fi

latest_make_version=$(/usr/bin/curl "https://ftp.gnu.org/gnu/make/?C=M;O=D" -s \
    | rg -o "href=\"make[^\"]*" \
    | /usr/bin/sed "s/href=\"//g" \
    | /usr/bin/head -2 \
    | /usr/bin/tail -1)

if [[ ! $(command -v make) ]]; then
    /usr/bin/echo "[?] Installing Make via APT..."
    /usr/bin/sudo /usr/bin/apt install make -y
fi

SCRIPTS_DIR="./setup_scripts"
$SCRIPTS_DIR/apt.sh
$SCRIPTS_DIR/cargo.sh
$SCRIPTS_DIR/github.sh
$SCRIPTS_DIR/go.sh
$SCRIPTS_DIR/other.sh
