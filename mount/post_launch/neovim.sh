# https://github.com/neovim/neovim/blob/master/INSTALL.md#linux

# Exit early if we've already installed Neovim previously
if [ -d "/opt/nvim" ]; then
    exit 1
fi

cd ~/

# Install Neovim. Note that there is no release package for ARM64, so we'll have to build one ourselves.
if [ "$(uname -m)" = "aarch64" ]; then
    # Install build prerequisites
    sudo apt install ninja-build gettext cmake unzip curl -y

    # Clone Neovim
    git clone https://github.com/neovim/neovim /opt/nvim/source
    cd /opt/nvim/source
    git checkout stable

    # Build & install
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install

    # Cleanup
    cd ~/
    mv /opt/nvim/source/build/* /opt/nvim
    rm -rf /opt/nvim/source
else
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    sudo mv /opt/nvim-linux64 /opt/nvim
    rm nvim-linux64.tar.gz
fi

# Add Neovim to PATH
path_export='export PATH="$PATH:/opt/nvim/bin"'
if ! grep -q "$path_export" ~/.bashrc; then
    echo "$path_export" >> ~/.bashrc
fi
