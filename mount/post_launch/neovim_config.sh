#!/bin/bash

if ! grep -q "alias nvimc=" "$HOME/.bashrc"; then
  echo 'alias nvimc="cd ~/.config/nvim && nvim ."' >> "$HOME/.bashrc"
fi

# Install dependencies
sudo apt install ripgrep -y # For telescope
