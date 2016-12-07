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

for f in bashrc bash_profile gitconfig gvimrc tmux.conf vim vimrc zshrc; do
    new=$(pwd)/$f
    old=~/.$f

    # If file already exists, create a backup
    if [[ -e $old ]]; then
        mv $old $backup_dir;
    fi;

    # Create the symlink
    ln -sf $new $old;
done;

vim +BundleInstall +qall

ZSHRC_LOCAL="$HOME/.zshrc_local"
if ! grep -q "GIT_AUTHOR_NAME" $ZSHRC_LOCAL; then
  echo "Git setup"
  echo -n "Enter name: "
  read name
  echo -n "Enter email: "
  read email
  touch $ZSHRC_LOCAL
  echo "export GIT_AUTHOR_NAME=\"$name\"" >> $ZSHRC_LOCAL
  echo "export GIT_COMMITTER_NAME=\$GIT_AUTHOR_NAME" >> $ZSHRC_LOCAL
  echo "export EMAIL=\"$email\"" >> $ZSHRC_LOCAL
  echo "export GIT_AUTHOR_EMAIL=\$EMAIL" >> $ZSHRC_LOCAL
  echo "export GIT_COMMITTER_EMAIL=\$EMAIL" >> $ZSHRC_LOCAL
fi
