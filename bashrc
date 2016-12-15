# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Settings for prompt
CYAN="\[$(tput setaf 6)\]"
YELLOW="\[$(tput setaf 3)\]"
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 9)\]"
RESET="\[$(tput sgr0)\]"
export PS1="\n$CYAN\u$RESET@$YELLOW\h $GREEN\w$RED\n♥$RESET "

# Enable colorized ls output on mac.
export CLICOLOR=1

# Don't put duplicate lines in the history file, and erase existing duplicates.
HISTCONTROL=ignoredups,erasedups

# Save all commands in history.
HISTSIZE=

# Append to the history file, don't overwrite it.
shopt -s histappend

if [ -f ~/.bashrc_local ]; then
  . ~/.bashrc_local
fi
