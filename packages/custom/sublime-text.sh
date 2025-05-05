#!/bin/bash

set -e

echo "[+] Installing Sublime Text"

# Install APT transport if not already present
sudo apt-get install -y apt-transport-https ca-certificates wget gnupg

# Add GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg \
  | gpg --dearmor \
  | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

# Add stable channel (or switch to dev if needed)
echo "deb https://download.sublimetext.com/ apt/stable/" \
  | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update and install
sudo apt-get update
sudo apt-get install -y sublime-text