#!/bin/bash

# Setup base .config files for first-time installation
if [ ! -d "~/.tmux/" ]; then
    mkdir ~/.tmux/
fi

cd ~/.tmux/

# Grab zip file of nvim configs from hosted site
wget https://kingscott.github.io/.dotfiles/tmux.zip
unzip tmux.zip 
rm tmux.zip 

# Setup tmux conf
mv tmux/tmux.conf ~/.tmux.conf

# Copy tmux layouts
mv ./tmux/layouts/ ./plugins/tmuxifier/
rm -r ./tmux

# Open tmux to finish install:
echo "Please open tmux to finish the installation by entering Ctrl + I and Ctrl + U."
