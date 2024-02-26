if [ ! -d ~/.config/nvim ]; then
  git clone git@github.com:ThatStevenGuy/nvimrc.git ~/.config/nvim
fi

if ! grep -q 'alias nvimc=' ~/.bashrc; then
  echo 'alias nvimc="cd ~/.config/nvim && nvim ."' >> ~/.bashrc
fi

# Install dependencies
sudo apt install ripgrep -y # For telescope
