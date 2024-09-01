#!/bin/bash

CURRENT_NODE_VERSION=$(node --version 2>/dev/null)
LASTEST_NODE_PACKAGE=$(/usr/bin/curl https://nodejs.org/dist/latest-iron/ -s \
    | /usr/bin/grep -o 'node[^"]*linux-x64.tar.gz' \
    | /usr/bin/tail -1)

install_node=$([[ $LASTEST_NODE_PACKAGE != *$CURRENT_NODE_VERSION* ]] && echo "true")

if [[ $install_node || ! $(command -v node) ]]; then
    /usr/bin/echo "[?] Node install"
    /usr/bin/wget "https://nodejs.org/dist/latest-iron/$LASTEST_NODE_PACKAGE" \
        -O "/tmp/$LASTEST_NODE_PACKAGE"
    /usr/bin/sudo /usr/bin/tar xzf "/tmp/$LASTEST_NODE_PACKAGE" -C /opt

    NODE_PACKAGE=$(echo $LASTEST_NODE_PACKAGE | sed 's/.tar.gz//')
    /usr/bin/sudo /usr/bin/mv /opt/$NODE_PACKAGE /opt/node
    /usr/bin/sudo /usr/bin/ln -s /opt/node/bin/node /usr/local/bin/node
else
   /usr/bin/echo "[?] Skipping Node install"
fi

mgba_image="mGBA*appimage"
/usr/bin/gh release download -R mgba-emu/emgba -p "$mgba_image" -D /tmp
/usr/bin/sudo /usr/bin/chown root:root "/tmp/$mgba_image"
/usr/bin/sudo /usr/bin/chmod 755 "/tmp/$mgba_image"
/usr/bin/sudo /usr/bin/mv /tmp/$mgba_image /opt

if [[ $(/usr/bin/uname -a) == *WSL* ]]; then
    /usr/bin/echo "[?] Skipping attack tools install"
    exit 0
fi

/usr/bin/echo "[?] Logic2 install"
LOGIC2_URL="https://logic2api.saleae.com/download?os=linux&arch=x64"
/usr/bin/sudo /usr/bin/wget $LOGIC2_URL -O /usr/local/bin/logic2
/usr/bin/sudo /usr/bin/chmod 0755 /usr/local/bin/logic2

/usr/bin/echo "[?] Stegsolve install"
STEGSOLVE_URL="http://www.caesum.com/handbook/Stegsolve.jar"
/usr/bin/sudo /usr/bin/wget $STEGSOLVE_URL -O /opt/Stegsolve.jar
/usr/bin/sudo /usr/bin/chmod 0755 /opt/stegsolve.jar

/usr/bin/echo "[?] Burpsuite install"
BURP_URL="https://portswigger.net/burp/releases/startdownload?product=community&type=Jar"
/usr/bin/sudo /usr/bin/wget $BURP_URL -O /usr/share/burpsuite/burpsuite.jar
/usr/bin/sudo /usr/bin/chmod 0755 /usr/share/burpsuite/burpsuite.jar

/usr/bin/echo "[?] IDA install"
IDA_URL='https://out7.hex-rays.com/files/idafree84_linux.run'
/usr/bin/sudo /usr/bin/wget $IDA_URL -O /opt/idafree84_linux.run
/usr/bin/sudo /usr/bin/chmod 0755 /opt/idafree84_linux.run

/usr/bin/sudo /opt/idafree84_linux.run \
    --debuglevel 3 --prefix /opt/idafree-8.4 --mode unattended

/usr/bin/sudo /usr/bin/apt-get install -y \
    python3 python3-pip python3-dev git \
    libssl-dev libffi-dev build-essential

/usr/bin/sudo /usr/bin/pip3 install pip pwntools pwncat-cs

/usr/bin/sudo /usr/bin/gem install wpscan
