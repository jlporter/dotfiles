setenv HOSTNAME `uname -n`
setenv OS `uname -s`
setenv ARCH `uname -m`
setenv OSREL `uname -r | sed 's/\(..\).*/\1/'`

set prompt='\n%{\033[32m%}%m %{\033[33m%}%~\n%{\033[0m%}T '

setenv EDITOR vi
set nobeep
umask 002

if ($?prompt) then
    bindkey -v # vi mode
    set notify
    set history=10000
    set savehist=(10000 merge)
    set autoexpand
    set autolist=ambiguous
    unset autologout
    set listmax=30
    set matchbeep=nomatch
    set noclobber

##### Aliases #####
    alias ls "ls --color=auto"
    alias g "gvim --remote-tab-silent"
    alias grep 'grep --color=auto'
endif

##
##  Tcsh goodies:
##
if (($?prompt) && ($?tcsh) && ($?TERM)) then
    # Attempt to correct spelling errors when expanding
    set autocorrect
    # Ignore files ending ~ when completing filenames
    set fignore=(\~)

    set rmstar

    # Commands which require special completion
    complete alias p/1/a/
    complete cd p/1/d/
    complete chgrp c/-/"(f R)"/ n/-/g/ p/1/g/ 'n/*/f/'
    complete chown c/-/"(f R)"/ C/:/f/ 'c/*:/g/' n/-/u/ p/1/u/ 'n/*/f/'
    complete dd c/if=/f/ c/of=/f/
    complete exec p/1/c/
    complete limit c/-/"(h)"/ 'n/*/l/'
    complete man 'n/*/c/'
    complete pushd p/1/d/
    complete rm 'n/*/f:*/'
    complete set 'c/*=/f/' p/1/s/= n/=/f/
    complete time p/1/c/
    complete unalias 'n/*/a/'
    complete unlimit c/-/"(h)"/ 'n/*/l/'
    complete unset 'n/*/s/'
    complete unsetenv '/n/*/e/'
    complete zcat 'n/*/f:*.{gz,Z,z}/'
    complete {cc,gcc} c/-{I,L}/d/
    complete {which,where} 'n/*/c/'
    complete {xdvi,dvips} 'n/*/f:*.dvi/'

    # Label xterms with current working directory.
    if ($TERM == "xterm" || $TERM == "xterms") then
	alias cwdcmd 'echo -n "]2;${HOST}:$cwd ]1;${HOST}"'

	alias ssh \
		'echo -n "]2;\!:0-$ ]1;\!:1"; \ssh \!:^-$; cwdcmd'
	cwdcmd
    endif
endif

# Source local machine settings if available
if ( -e ~/.cshrc_local ) then
    source ~/.cshrc_local
endif

# vim: syntax=csh
