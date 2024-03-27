#!/bin/bash

# Setup base .config files
if [ ! -d "~/.tmux/" ]; then
    mkdir ~/.tmux/
fi
cd ~/.tmux/

# Grab zip file of nvim configs from hosted site
wget https://kingscott.github.io/.dotfiles/tmux.zip
unzip tmux.zip 
rm tmux.zip 

# Setup tmux conf
mv ./tmux.conf ~/.tmux.conf

# Copy files downloaded from repo to local config directory (~/.config)
cp -r ./tmux/ ./ 

# Open tmux to finish install:
echo "Please open tmux to finish the install by entering Ctrl + I and Ctrl + U".
