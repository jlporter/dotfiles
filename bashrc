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
export PS1="$CYAN\u$RESET@$YELLOW\h $GREEN\w$RED\n♥$RESET "

# Enable colorized ls output on mac.
export CLICOLOR=1

# From
# https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows/1292#1292
# Don't put duplicate lines in the history file, and erase existing duplicates.
HISTCONTROL=ignoredups:erasedups
# Save all commands in history.
HISTSIZE=
# Save and reload history after each command finishes.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Append to the history file, don't overwrite it.
shopt -s histappend

if [ -f ~/.bashrc_local ]; then
  . ~/.bashrc_local
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

alias g="gvim --remote-tab"

# Disable bell.
bind 'set bell-style none'
