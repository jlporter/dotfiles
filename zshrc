setopt prompt_subst
autoload -U colors && colors
PROMPT=$'
%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %{$fg[green]%}%~%{$reset_color%}
%{$fg[red]%}♥%{$reset_color%} '

# Use emacs key bindings.
bindkey -e

autoload zmv

# Setup aliases.
alias ls='ls --color=auto'
alias g="gvim --remote-tab-silent"
if [ -f /proc/cpuinfo ]; then
  alias make="make --jobs --max-load `grep processor /proc/cpuinfo | wc -l`"
fi

export EDITOR=gvim

if [ -f ~/.zshrc_local ]; then
  . ~/.zshrc_local
fi
