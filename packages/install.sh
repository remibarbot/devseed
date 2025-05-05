#!/bin/bash

set -e

INSTALLER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$INSTALLER_DIR")"
PKG_LIST="$INSTALLER_DIR/packages.txt"

echo "Updating APT..."
sudo apt update

while IFS= read -r line; do
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

  if [[ "$line" =~ ^\[custom\] ]]; then
    name=$(echo "$line" | cut -d':' -f1 | cut -d']' -f2 | xargs)
    desc=$(echo "$line" | cut -d':' -f2 | xargs)
    cmd=$(echo "$line" | cut -d':' -f3- | xargs)

    echo "Installing custom package: $name - $desc"
    eval "$cmd"

  elif [[ "$line" =~ ^\[custom-script\] ]]; then
    name=$(echo "$line" | cut -d':' -f1 | cut -d']' -f2 | xargs)
    desc=$(echo "$line" | cut -d':' -f2 | xargs)
    script_path=$(echo "$line" | cut -d':' -f3- | xargs)
    full_path="$REPO_ROOT/$script_path"
    if [[ -f "$full_path" ]]; then
      echo "Installing custom script: $name - $desc"
      echo "Executing: $full_path"
      if ! bash "$full_path"; then
        echo "[!] Script $name failed but continuing..."
      fi
    else
      echo "[!] Script not found: $full_path"
      exit 1
    fi

  else
    pkg=$(echo "$line" | cut -d':' -f1 | xargs)
    desc=$(echo "$line" | cut -d':' -f2 | xargs)

    echo "Installing $pkg - $desc"
    sudo apt install -y "$pkg"
  fi
done < <(cat "$PKG_LIST")
echo "[✔] All packages processed."