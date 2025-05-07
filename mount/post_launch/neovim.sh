#!/bin/bash

# Exit immediately if anything errors out
set -e

# Exit early if Neovim is already installed
if [ -d "/opt/nvim" ]; then
    exit 1
fi

cd "$HOME"

# Determine the package name
if [ "$(uname -m)" = "aarch64" ]; then
    package_name="nvim-linux-arm64.tar.gz"
else
    package_name="nvim-linux-x86_64.tar.gz"
fi

# Strip .tar.gz for the extracted folder name
folder_name="${package_name%.tar.gz}"

# Download & extract
curl -fLO "https://github.com/neovim/neovim/releases/latest/download/$package_name"
sudo tar -C /opt -xzf "$package_name"
sudo mv "/opt/$folder_name" /opt/nvim
rm -f "$package_name"

# Add Neovim to PATH
path_export='export PATH="$PATH:/opt/nvim/bin"'
if ! grep -q "$path_export" "$HOME/.bashrc"; then
    echo "$path_export" >> "$HOME/.bashrc"
fi
