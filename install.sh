#!/bin/bash

# Ansible needs the token
sudo id

pip3 install -r requirements.txt
ansible-playbook init.yml

# All tools should be downloaded and some installed by now
# But some require extra steps

$original_exec_dir = $(pwd)
cd /opt

# Burpsuite
sudo mv burpsuite*.jar /usr/share/burpsuite/burpsuite.jar

# Chisel
sudo gunzip chisel*
sudo chmod o+x chisel*
sudo mv chisel* /usr/local/bin/chisel

# Dextools
sudo unzip dex-tools*.zip
sudo rm -f dex-tools*.zip

# Ghidra
sudo unzip ghidra*
sudo rm -f ghidra*.zip

# Hashcat
sudo 7z -d hashcat*

# mimikatz
sudo 7z x mimikatz* -o/usr/share/mimikatz -y
sudo rm mimikatz*

# node
sudo tar xzf node*
