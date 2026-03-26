#!/bin/bash
set -e # Exit on error
set -u # Exit on unset variables

# Initialize submodules
git pull
git submodule init
git submodule update --init --recursive

# Uncomment to update submodules
#git submodule foreach git pull origin master

# Create a backup directory
backup_dir=backup-$(date +"%Y-%m-%d_%Hh%Mm%Ss")
mkdir -p $backup_dir;

# Use a glob to find all files/dirs starting with 'dot-'
for dotfile in dot-*; do
  # Skip if no matches are found
  [[ -e "$dotfile" ]] || continue

  # Strip 'dot-' prefix to get the target name (e.g., .bashrc)
  target_name=".${dotfile#dot-}"
  target_path="$HOME/$target_name"

  if [[ -e "$target_path" || -L "$target_path" ]]; then
    if [[ ! -L "$target_path" ]]; then
      echo "Backing up real file: $target_name"
      mkdir -p "$backup_dir"
      mv "$target_path" "$backup_dir/"
    else
      echo "Removing existing symlink: $target_name"
      rm "$target_path"
    fi
  fi

done

# Delete backup directory if it's empty
rmdir "$backup_dir" 2>/dev/null

stow --dotfiles --target="$HOME" .

vim +BundleInstall +qall

RCLOCAL="$HOME/.bashrc_local"
if ! grep -q "GIT_AUTHOR_NAME" $RCLOCAL; then
  echo "Git setup"
  echo -n "Enter name: "
  read name
  echo -n "Enter email: "
  read email
  touch $RCLOCAL
  echo "export GIT_AUTHOR_NAME=\"$name\"" >> $RCLOCAL
  echo "export GIT_COMMITTER_NAME=\$GIT_AUTHOR_NAME" >> $RCLOCAL
  echo "export EMAIL=\"$email\"" >> $RCLOCAL
  echo "export GIT_AUTHOR_EMAIL=\$EMAIL" >> $RCLOCAL
  echo "export GIT_COMMITTER_EMAIL=\$EMAIL" >> $RCLOCAL
fi
