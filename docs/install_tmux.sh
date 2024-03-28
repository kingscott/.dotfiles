#!/bin/bash

# Setup base .config files for first-time installation
if [ ! -d "~/.tmux/" ]; then
    mkdir ~/.tmux/
fi

# Pull in TPM from git
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/.tmux/

# Grab zip file of nvim configs from hosted site
wget https://kingscott.github.io/.dotfiles/tmux.zip
unzip tmux.zip 
rm tmux.zip 

# Setup tmux conf
mv tmux/tmux.conf ~/.tmux.conf

echo 'export PATH="$HOME/.tmux/plugins/tmuxifier/bin"' >> ~/.zshrc 
echo 'eval "$(tmuxifier init -)"' >> ~/.zshrc

# Open tmux to finish install:
echo "Please open tmux to finish the installation by entering Ctrl + I and Ctrl + U, and copy layouts over to plugins/tmuxifier/layouts."
echo "Remember to source your .zshrc as well."
cd 
rm -- "$0"
