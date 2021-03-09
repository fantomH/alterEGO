#--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# .bashrc:
#   created:       '2021-02-26 02:54:43 UTC'
#   updated:       '2021-03-08 10:16:18 UTC'
#   description:   'Bash config file.' 
#   app:           'bash'
#   target:        '$HOME/.bashrc'
#
#------------------------------{ alterEGO Linux }------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export ffconf="${HOME}/.mozilla/firefox/alterego-firefox.default"

#----------{ VAVIABLES }

  export TERM="xterm-256color"

#----------{ DEFAULT APPLICATIONS }

  export FZF_DEFAULT_COMMAND='rg --files --hidden '

PS1='[\u@\h \W]\$ '

#--[ ALIASES ]

alias ls='ls --all --color=auto'
alias tmux="env TERM=screen-256color tmux -u"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# vim: syntax=sh
#--{ file:fin }----------------------------------------------------------------
