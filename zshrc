# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="steeef"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew git heroku node npm osx svn vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source $HOME/dotfiles/zsh-theme
bindkey '^R' history-incremental-search-backward

autoload zmv

alias g="gvim --remote-tab-silent"

export EDITOR=vim

if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi

source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
