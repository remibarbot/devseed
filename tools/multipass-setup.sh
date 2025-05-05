#!/bin/bash

set -e

echo "[+] Installing Multipass"

if ! command -v snap >/dev/null 2>&1; then
  echo "[!] Snap is not installed. Please install Snap manually first."
  echo "See: https://snapcraft.io/docs/installing-snapd"
  exit 1
fi

sudo snap install multipass --classic

echo "[✓] Multipass installed successfully"
