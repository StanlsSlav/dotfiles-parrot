#!/bin/bash

/usr/bin/sudo /usr/bin/apt -y update
/usr/bin/sudo /usr/bin/apt -y upgrade

if [[ $(uname -a) == *WSL2* ]]; then
    /usr/bin/sudo /usr/bin/apt -y install \
        python3.10-venv
else
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
    unzip

/usr/bin/sudo /usr/bin/apt -y remove --purge
