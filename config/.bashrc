#--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# .bashrc:
#   created:       '2021-02-26 02:54:43 UTC'
#   updated:       '2021-02-26 02:54:56 UTC'
#   description:   'Bash config file.' 
#   app:           'bash'
#   target:        '$HOME/.bashrc'
#------------------------------{ alterEGO Linux }------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export ffconf="${HOME}/.mozilla/firefox/alterego-firefox.default"

PS1='[\u@\h \W]\$ '

#--[ ALIASES ]

alias ls='ls --all --color=auto'

#--{ file:fin }----------------------------------------------------------------
