#!/bin/bash

# Ensure all scripts in the mount folder are executable. The mounting point is read-only, so we must do this in advance.
for file in "mount"/**/*.sh; do
  if [ ! -x "$file" ]; then
    echo "Making post-launch script "$file" executable"
    chmod +x "$file"
  fi
done

# Fire up the container
docker compose up
