#!/bin/bash

echo "[?] APT install"

current_date=$(/usr/bin/date -d "now" +%s)
last_apt_update=$(/usr/bin/stat /var/cache/apt/pkgcache.bin -c %Y)

sec_diff=$((current_date - last_apt_update))
days_diff=$((sec_diff / 86400))

if [[ $days_diff -gt 2 ]]; then
    echo "[?] Updating and upgrading APT packages"
    /usr/bin/sudo /usr/bin/apt -y update
    /usr/bin/sudo /usr/bin/apt -y upgrade
else
    echo "[?] Skipping APT update and upgrade"
fi

if [[ $(uname -a) != *WSL* ]]; then
    /usr/bin/sudo /usr/bin/apt -y install \
        containerd.io \
        docker.io \
        exiftool \
        git \
        openvpn \
        binwalk \
        fcrackzip \
        nmap \
        wireshark \
        whatweb \
        p7zip
fi

/usr/bin/sudo /usr/bin/apt -y install \
    jq \
    clang \
    unzip \
    python3-venv \
    python3-libtmux

/usr/bin/sudo /usr/bin/apt -y remove --purge
