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
    if ( -f ~/.aliases ) source ~/.aliases
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

switch($HOSTNAME)
case *.eecs.harvard.edu:
    # Setup for cad tools
    if (-f /home/cktcad/Tools2009/bin/cshrc.tools2009) then
      source /home/cktcad/Tools2009/bin/cshrc.tools2009
    endif
    setenv CDS_INST_DIR /home/cktcad/Tools2006/Cadence/IUS54
    setenv VCS_HOME /group/guyeon/cktcad/tools/synopsys/vcs-mx
    setenv VCS_ARCH_OVERRIDE linux
    set path = ( /group/guyeon/cktcad/tools/synopsys/syn/bin $VCS_HOME/bin $path )
    # Set path for code sorcery arm compiler.
    if (-e /group/brooks/cgonzo/sourcery/arm-2010q1/bin) then
        set path = ( /group/brooks/cgonzo/sourcery/arm-2010q1/bin $path )
    endif

    # Autopilot setup
    setenv XILINXD_LICENSE_FILE 2100@140.247.60.218
    if (-e /group/guyeon/cktcad/tools/xilinx/autoesl/bin/) then
        set path = ( /group/guyeon/cktcad/tools/xilinx/autoesl/bin/ $path )
    endif
breaksw
endsw
