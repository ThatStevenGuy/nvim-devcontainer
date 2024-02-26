#!/bin/bash

# Reset the working directory in case this script was launched from another path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Ensure all scripts in the mount directory are executable. The mount directory will be mounted as read-only, so we
# must make our changes in advance.
if [ -d "mount" ]; then
  for file in "mount"/**/*.sh; do
    if [ -f "$file" ] && [ ! -x "$file" ]; then
      echo "Making script \""$file"\" executable."
      chmod +x "$file"
    fi
  done
fi

# Fire up the container
docker compose up
