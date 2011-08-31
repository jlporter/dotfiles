#Set vi mode
set -o vi

##### Environment Variables #####
EDITOR=vim
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\h \[\e[33m\]\w\[\e[0m\]\nB '

##### shopt #####
# Fix spelling error in cd
shopt -s cdspell
# Check window size after each command and update LINES and COLUMNS
shopt -s checkwinsize
# Corretion spelling on directory names during completion. Doesn't seem to exist on mac's bash
#shopt -s dirspell
# Don't send hangup signal to jobs on exit
shopt -u huponexit

##### Configure history behavior #####
HISTCONTROL="erasedups:ignoreboth"
HISTFILESIZE=500000
HISTSIZE=100000
# Append to history
shopt -s histappend
# Store multiline commands as single line
shopt -s cmdhist

##### Aliases #####
alias g="gvim --remote-tab-silent"
alias grep="grep --color=auto"
# Mac has a different option for ls color output
if [ `uname` == Darwin ]; then
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
fi


## Setup bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f /opt/local/etc/bash_completion ]; then
    # Location on mac
    . /opt/local/etc/bash_completion
fi

##########
# Setup lesspipe
##########
[ -x `type -P lesspipe` ] && eval "$(`type -P lesspipe`)"

# vim: syntax=sh
