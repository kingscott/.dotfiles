#!/bin/bash

# Setup base .config files
if [ -d "~/.config/alacritty" ]; then
    mdkir ~/.config/alacritty
fi
cd ~/.config/alacritty

# Grab zip file of nvim configs from hosted site
wget https://kingscott.github.io/.dotfiles/alacritty.zip .
unzip alacritty.zip 
rm alacritty.zip 

# Copy files downloaded from repo to local config directory (~/.config)
cp -r ./alacritty/ ./ 

