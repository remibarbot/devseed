#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Installing Zsh, Oh My Zsh, Starship, and plugins..."

# Install dependencies
sudo apt install -y zsh curl git unzip fonts-powerline

# Install Oh My Zsh (non-interactive)
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
echo "[+] Installing plugins into $ZSH_CUSTOM/plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"

# Copy .zshrc and Starship config
echo "[+] Copying .zshrc and Starship config..."
mkdir -p ~/.config
cp "$SCRIPT_DIR/.zshrc" ~/
cp "$SCRIPT_DIR/starship.toml" ~/.config/

# Change default shell to Zsh
chsh -s "$(which zsh)"

echo "[✓] Zsh stack installed successfully. Restart your terminal to activate it."
