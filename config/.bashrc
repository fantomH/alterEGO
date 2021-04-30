#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# .bashrc
#   created        : 2021-02-26 02:54:43 UTC
#   updated        : 2021-04-29 19:06:03 UTC
#   description    : Bash config file. 
#   app            : bash
#   target         : $HOME/.bashrc
#------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#----------{ VAVIABLES }

  export TERM="xterm-256color"

#----------{ PROMPTS }

  PS1='[\u@\h \W]\$ '

#----------{ ALIASES }

  alias grep="grep --color=always"
  alias ll='ls --all --human-readable -l --color=auto'
  alias ls='ls --all --color=auto'
  alias open="xdg-open"
  alias reload="source ${HOME}/.bashrc"
  # -- Makes tmux understand the environment is important.
  alias tmux="env TERM=screen-256color tmux -u"

#----------{ FUNCTIONS }

busy() {
    # -- v. 2021-04-27 13:46:04 UTC

    # -- When the boss comes around to look busy.
    # .. ref: https://www.commandlinefu.com/commands/view/6663/pretend-to-be-busy-in-office-to-enjoy-a-cup-of-coffee
    # .. CTRL+c to quit.

    cat /dev/urandom                                                          \
    | hexdump -C                                                              \
    | grep --color=always 'ca fe'

} #--{ function:FIN }

fuck() {
    # -- v. 2021-04-27 13:52:55 UTC

    # -- Repeat last cmd with sudo if forgotten.

    sudo $(history -p !!)

} #--{ function:FIN }

#----------{ SOURCING }

  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# vim: syntax=sh
#--{ file:FIN }----------------------------------------------------------------
