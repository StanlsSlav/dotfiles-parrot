#!/bin/bash

/usr/bin/echo "[?] Node install"
LASTEST_NODE_PACKAGE=$(/usr/bin/curl https://nodejs.org/dist/latest-iron/ -s | /usr/bin/grep '.*linux-x64.*gz' | /usr/bin/cut -d '"' -f2)
/usr/bin/wget https://nodejs.org/dist/latest-iron/$LASTEST_NODE_PACKAGE -O $HOME/Downloads/$LASTEST_NODE_PACKAGE
/usr/bin/sudo /usr/bin/tar -xzf $HOME/Downloads/$LASTEST_NODE_PACKAGE -C /opt

NODE_PACKAGE=$(echo $LASTEST_NODE_PACKAGE | sed 's/.tar.gz//')
/usr/bin/sudo /usr/bin/mv /opt/$NODE_PACKAGE /opt/node
/usr/bin/sudo /usr/bin/ln -s /opt/node/bin/node /usr/local/bin/node

if [[ $(/usr/bin/uname -a) == *WSL* ]]; then
    echo "[?] Skipping other attack tools install"
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
BURPSUITE_URL="https://portswigger.net/burp/releases/startdownload?product=community&type=Jar"
/usr/bin/sudo /usr/bin/wget $BURPSUITE_URL -O /usr/share/burpsuite/burpsuite.jar
/usr/bin/sudo /usr/bin/chmod 0755 /usr/share/burpsuite/burpsuite.jar

/usr/bin/echo "[?] IDA install"
IDA_URL='https://out7.hex-rays.com/files/idafree84_linux.run'
/usr/bin/sudo /usr/bin/wget $IDA_URL -O /opt/idafree84_linux.run
/usr/bin/sudo /usr/bin/chmod 0755 /opt/idafree84_linux.run

/usr/bin/sudo /opt/idafree84_linux.run --debuglevel 3 --prefix /opt/idafree-8.4 --mode unattended

/usr/bin/sudo /usr/bin/apt-get install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential

/usr/bin/sudo /usr/bin/pip3 install pip pwntools pwncat-cs

/usr/bin/sudo /usr/bin/gem install wpscan
