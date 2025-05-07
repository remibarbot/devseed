#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Installing WezTerm config..."

cp "$SCRIPT_DIR/.wezterm.lua" ~/.wezterm.lua

echo "[✓] WezTerm config installed at ~/.wezterm.lua"
