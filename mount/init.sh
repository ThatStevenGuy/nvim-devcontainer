#!/bin/bash

echo "Initializing dev container..."

script_exec() {
  script_path="post_launch/$1"

  if [ -f "$script_path" ]; then
    echo "Executing post-launch script '$1'."
    "$script_path"
  else
    echo "Error: Script $1 not found in 'post_launch' directory."
  fi
}

script_exec apt.sh
script_exec ssh_fingerprints.sh
script_exec neovim.sh
script_exec neovim_config.sh

echo "Dev container initialized. Get stuff done!"
