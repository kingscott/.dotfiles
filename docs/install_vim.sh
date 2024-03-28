#!/bin/bash

# [Optional] Install nvim, if doesn't exist?

# Setup base .config files
if [ ! -d "~/.config/nvim" ]; then
    mkdir ~/.config/nvim
fi
cd ~/.config/nvim

# Grab zip file of nvim configs from hosted site
wget https://kingscott.github.io/.dotfiles/nvim.zip
unzip nvim.zip 
rm nvim.zip 

# Copy files downloaded from repo to local config directory (~/.config)
cp -r ./nvim/ ./ 

# From the packer docs:
# You can also use the following command (with packer bootstrapped) to have packer setup your configuration (or simply run updates) and close once all operations are completed:
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "Neovim configs are successfully installed."
cd
rm -- "$0"
