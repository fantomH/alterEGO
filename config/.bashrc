## { alterEGO Linux: "Open the vault of knowledge" }---------------------------
##
## .bashrc
##   created        : 2021-02-26 02:54:43 UTC
##   updated        : 2021-08-31 21:49:45 UTC
##   description    : Bash config file. 
##   app            : bash
##   target         : $HOME/.bashrc
## ____________________________________________________________________________

  #### If not running interactively, don't do anything
  [[ $- != *i* ]] && return

## [ VAVIABLES ]

  export TERM="xterm-256color"

## [ PROMPTS ]

  PS1='[\u@\h \W]\$ '

## [ ALIASES ]

  alias grep="grep --color=always"
  alias ll='ls --all --human-readable -l --color=auto'
  alias ls='ls --all --color=auto'
  alias open="xdg-open"
  alias reload="source ${HOME}/.bashrc"

  #### Makes tmux understand the environment is important.
  alias tmux="env TERM=screen-256color tmux -u"

## [ SOURCING ]

  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# vim: syntax=sh
## { FIN }_____________________________________________________________________
