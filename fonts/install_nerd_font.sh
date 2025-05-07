#!/bin/bash
set -euo pipefail

echo "[+] Installing JetBrainMono Nerd Font..."

mkdir -p ~/.local/share/fonts
cd /tmp
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xf JetBrainsMono.tar.xz -C ~/.local/share/fonts/
fc-cache -fv

echo "[✓] JetBrainMono Nerd Font installed. Set it in your terminal emulator manually."
