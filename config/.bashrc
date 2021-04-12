#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# .bashrc:
#   created:       '2021-02-26 02:54:43 UTC'
#   updated:       '2021-04-12 13:16:03 UTC'
#   description:   'Bash config file.' 
#   app:           'bash'
#   target:        '$HOME/.bashrc'
#------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#----------{ VAVIABLES }

  export TERM="xterm-256color"

#----------{ DEFAULT APPLICATIONS }

  export FZF_DEFAULT_COMMAND='rg --files --hidden '
  export VISUAL=vim
  export EDITOR=${VISUAL}

#----------{ PROMPTS }

  PS1='[\u@\h \W]\$ '

#----------{ ALIASES }

  alias grep="grep --color=always"
  alias ll='ls --all --human-readable -l --color=auto'
  alias ls='ls --all --color=auto'
  alias reload="source ${HOME}/.bashrc"
  alias tmux="env TERM=screen-256color tmux -u"

#----------{ SOURCING }

  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  [ -f ~/.extrarc ] && source ~/.extrarc
  [ -f ~/.egorc ] && source ~/.egorc

# vim: syntax=sh
#--{ file:fin }----------------------------------------------------------------
