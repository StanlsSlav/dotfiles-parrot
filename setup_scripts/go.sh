#!/bin/bash

echo "[?] Go install"
if [[ $(uname -a) == *"WSL"* ]]; then
    echo "[?] Skipping go installation on WSL"
    exit 0
fi

/usr/bin/wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz -O /tmp/go.tar.gz
/usr/bin/sudo /usr/bin/tar xzf /tmp/go.tar.gz -C /opt

/usr/bin/sudo /usr/bin/ln -s /opt/go/bin/go /usr/local/bin/go

/usr/local/bin/go install github.com/ffuf/ffuf/v2@latest
