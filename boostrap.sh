#!/bin/bash
set -euo pipefail

sudo -v

# Keep sudo session alive during entire run
# (runs in the background until script exits)
( while true; do sudo -n true; sleep 60; done ) &

# Save PID so we can kill it later
SUDO_PID=$!

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🛠️  Bootstrapping full dev environment..."

# Install APT packages
echo "📦 Installing APT packages..."
bash "$PROJECT_ROOT/packages/install.sh"

# Install Nerd Font
echo "🎨 Installing Nerd Font..."
bash "$PROJECT_ROOT/fonts/install_nerd_font.sh"

# Install Zsh + Starship + Plugins
echo "🐚 Installing Zsh, Oh My Zsh, Starship, and plugins..."
bash "$PROJECT_ROOT/zsh/install_zsh_stack.sh"

# Set up WezTerm
echo "🖥️ Setting up terminal config (WezTerm)..."
bash "$PROJECT_ROOT/terminal/install_wezterm.sh"

# Set up Multipass
echo "Setting up Multipass..."
bash "$PROJECTDIR/tools/multipass-setup.sh"

# Set up Git
echo "Setting up Git ..."
bash "$PROJECTDIR/git/apply_config.sh"

echo "✅ All done! Please restart your terminal."

trap 'kill $SUDO_PID' EXIT
