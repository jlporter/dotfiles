#!/bin/bash

# Initialize submodules
git pull
git submodule init
git submodule update

# Uncomment to update submodules
#git submodule foreach git pull origin master

# Create a backup directory
backup_dir=backup-$(date +"%Y-%m-%d_%Hh%Mm%Ss")
mkdir -p $backup_dir;

for f in bashrc cshrc gitconfig gvimrc jshintrc screenrc tmux.conf vim vimrc zshrc; do
    new=$(pwd)/$f
    old=~/.$f

    # If file already exists, create a backup
    if [[ -e $old ]]; then
        mv $old $backup_dir;
    fi;

    # Create the symlink
    ln -sf $new $old;
done;
