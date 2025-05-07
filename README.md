# Neovim Dev Container 🫙
A quick and easy setup for Neovim dev containers.

## Requirements
- Docker engine with Docker compose.
- A Neovim config in `~/.config/nvim` (will be mounted by the container).
- Your projects folder available as `../Projects` relative to `launch.sh` (bit clumsy for now).

## Usage
- Make `launch.sh` executable using `chmod +x launch.sh`.
- Execute `launch.sh` to start the dev container.
- Connect to the dev container using `docker exec -it devcontainer /bin/bash`.

Your projects are available in `/workspace`. You can open Neovim using `nvim` and edit your Neovim config using `nvimc`.

## Docker Image
The latest `typescript-node` Docker image is used for the dev container. Replace with any other image that suits your needs.  
More Microsoft Docker images can be found [here](https://github.com/devcontainers/images) in the *src*-directory.