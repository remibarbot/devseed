#!/bin/bash

echo "[+] Setting up Git config"

git config --global include.path "$PWD/git/.gitconfig"
git config --global core.excludesfile "$PWD/git/.gitignore_global"
git config --global commit.template "$PWD/git/.gitmessage.txt"
