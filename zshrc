# Configure completion.
# zstyle :compinstall filename '/usr/local/google/home/jud/.zshrc'
# autoload -Uz compinit
# compinit

setopt prompt_subst
autoload -U colors && colors

# Use 256 color terms. This has to be specified for tmux to use 256 colors.
case "$TERM" in
  xterm*) TERM=xterm-256color
esac

PROMPT=$'
%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %{$fg[green]%}%~%{$reset_color%}
%{$fg[red]%}♥%{$reset_color%} '

# Use emacs key bindings.
bindkey -e

# Save history.
HISTFILE=$HOME/.zsh_history
# Save 100000 history entires, because disk space is cheap.
SAVEHIST=100000
HISTSIZE=100000
# Append new history to the file, rather than replacing, to get saner behavior
# when using multiple shells.
setopt inc_append_history
# Don't add command lines to history if they are duplicates of previous events.
setopt hist_ignore_dups
# Add some extra timestamps to the history file.
setopt extended_history

autoload zmv

# Setup aliases.
if [[ `uname` = "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
alias g="gvim --remote-tab-silent"
if [ -f /proc/cpuinfo ]; then
  alias make="make --jobs --max-load `grep processor /proc/cpuinfo | wc -l`"
fi

export EDITOR=vim

if [ -f ~/.zshrc_local ]; then
  . ~/.zshrc_local
fi
