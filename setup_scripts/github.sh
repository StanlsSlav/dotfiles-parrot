#!/bin/bash

echo "[?] Github install"

# Attack machine exclusive so far
if [[ $(uname -a) == *"WSL"* ]]; then
    echo "[?] Skipping GitHub tools installation on WSL"
    exit 0
fi

RUBY_SCRIPT=../install_git_tools.rb

/usr/bin/sudo $RUBY_SCRIPT -r 'NationalSecurityAgency/ghidra' -e '^ghidra_.*_PUBLIC_.*\.zip$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'hashcat/hashcat' -e '^hashcat-.*.7z$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'diego-treitos/linux-smart-enumeration' -e '^lse.sh$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'pwndbg/pwndbg' -e '^pwndbg_.*_amd64.deb$' -d '' -m '0755'
/usr/bin/sudo $RUBY_SCRIPT -r 'carlospolop/PEASS-ng' -e '^linpeas.sh$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'carlospolop/PEASS-ng' -e '^winPEAS.bat$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'ffuf/ffuf' -e '^ffuf_.*_linux_amd64.tar.gz$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'RickdeJager/stegseek' -e '^stegseek_.*.deb$' -d '' -m '0755'
/usr/bin/sudo $RUBY_SCRIPT -r 'pxb1988/dex2jar' -e '^dex-tools-v.*.zip$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'jpillora/chisel' -e '^chisel_.*_linux_amd64.gz$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'gentilkiwi/mimikatz' -e '^mimikatz_trunk.7z$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'appneta/tcpreplay' -e '^tcpreplay-.*.tar.gz$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'zaproxy/zaproxy' -e '^ZAP_WEEKLY_D-.*.zip$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'java-decompiler/jd-gui' -e '^jd-gui-1.6.6.jar$' -d '' -m ''
/usr/bin/sudo $RUBY_SCRIPT -r 'ethereum/remix-desktop' -e '^Remix-IDE-.*.AppImage$' -d '' -m '0755'
/usr/bin/sudo $RUBY_SCRIPT -r 'sonic-visualiser/sonic-visualiser' -e '^SonicVisualiser-.*-x86_64.AppImage$' -d '' -m '0755'

/usr/bin/sudo /usr/bin/git clone --depth 1 --single-branch git:sullo/nikto /opt/nikto
/usr/bin/sudo /usr/bin/git clone --depth 1 --single-branch git:RsaCtfTool/RsaCtfTool /opt/RsaCtfTool
/usr/bin/sudo /usr/bin/git clone --depth 1 --single-branch git:sqlmapproject/sqlmap /opt/sqlmap
/usr/bin/sudo /usr/bin/git clone --depth 1 --single-branch git:0dayCTF/reverse-shell-generator --branch main /opt/reverse-shell-generator
/usr/bin/sudo /usr/bin/git clone --depth 1 --single-branch git:sshuttle/sshuttle /opt/sshuttle
/usr/bin/sudo /usr/bin/git clone --depth 1 --single-branch git:sherlock-project/sherlock /opt/sherlock

/usr/bin/sudo /usr/bin/git clone --depth 1 --single-branch git:radareorg/radare2 /opt/radare2
/usr/bin/cd /opt/radare2
/opt/radare2/sys/install.sh
/usr/bin/cd -

/usr/bin/cd /opt/reverse-shell-generator
/usr/bin/docker build . -t reverse_shell_generator
/usr/bin/cd -

/usr/bin/cd /opt/sshuttle
/opt/sshuttle/setup.py install
/usr/bin/cd -

/usr/bin/cd /opt/sherlock
/usr/bin/pip3 install -r requirements.txt
/usr/bin/cd -

/usr/bin/cd /opt
/usr/bin/sudo /usr/bin/dpkg -i pwdbg* && rm pwndbg*
