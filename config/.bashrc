## { alterEGO Linux: "Open the vault of knowledge" }---------------------------
##
## .bashrc
##   created        : 2021-02-26 02:54:43 UTC
##   updated        : 2021-09-01 11:05:32 UTC
##   description    : Bash config file. 
##   app            : bash
##   target         : $HOME/.bashrc
## ____________________________________________________________________________

  #### If not running interactively, don't do anything
  [[ $- != *i* ]] && return

## [ ALIASES ]

  alias grep="grep --color=always"
  alias ll='ls --all --human-readable -l --color=auto'
  alias ls='ls --all --color=auto'
  alias open="xdg-open"
  alias reload="source ${HOME}/.bashrc"

  #### Makes tmux understand the environment is important.
  alias tmux="env TERM=screen-256color tmux -u"

## [ HISTORY ]

  export HISTIGNORE="exit"
  export HISTCONTROL=ignoreboth:erasedups
  export HISTSIZE=10000
  export HISEFILESIZE=10000
  # export HISTTIMEFORMAT="%Y-%m-%d %T %z "

## [ MAN IN COLOR ]

  #### TODO Need to work on the colors.
  # export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
  # export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode – bold, magenta
  # export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
  # export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
  # export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
  # export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
  # export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan

## [ SOURCING ]

  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# vim: syntax=sh
## { FIN }_____________________________________________________________________
