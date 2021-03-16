#--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# .bashrc:
#   created:       '2021-02-26 02:54:43 UTC'
#   updated:       '2021-03-10 11:22:09 UTC'
#   description:   'Bash config file.' 
#   app:           'bash'
#   target:        '$HOME/.bashrc'
#
#------------------------------{ alterEGO Linux }------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#----------{ VAVIABLES }

  export TERM="xterm-256color"

#----------{ DEFAULT APPLICATIONS }

  export FZF_DEFAULT_COMMAND='rg --files --hidden '

PS1='[\u@\h \W]\$ '

#--[ ALIASES ]

alias ll='ls --all --human-readable -l --color=auto'
alias ls='ls --all --color=auto'
alias reload="source ${HOME}/.bashrc"
# alias tmux="env TERM=screen-256color tmux -u"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.extrarc ] && source ~/.extrarc


# vim: syntax=sh
#--{ file:fin }----------------------------------------------------------------
