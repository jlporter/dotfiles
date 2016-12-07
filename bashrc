# Settings for prompt
CYAN="\[$(tput setaf 6)\]"
YELLOW="\[$(tput setaf 3)\]"
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 9)\]"
RESET="\[$(tput sgr0)\]"
export PS1="\n$CYAN\u$RESET@$YELLOW\h $GREEN\w$RED\n♥$RESET "

# Enable colorized ls output on mac.
export CLICOLOR=1
