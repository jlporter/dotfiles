#!/usr/bin/env sh
git submodule foreach 'git checkout master; git pull'
vim +PluginUpdate +qall
