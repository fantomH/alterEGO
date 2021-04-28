#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# .bashrc
#   created        : 2021-02-26 02:54:43 UTC
#   updated        : 2021-04-27 13:19:12 UTC
#   description    : Bash config file. 
#   app            : bash
#   target         : $HOME/.bashrc
#------------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#----------{ VAVIABLES }

  export TERM="xterm-256color"

#----------{ DEFAULT APPLICATIONS }

  export BROWSER=firefox
  export FZF_DEFAULT_COMMAND='rg --files --hidden '
  export TERMINAL="xfce4-terminal --hide-scrollbar --hide-menubar --hide-toolbar"
  export VISUAL=vim
  export EDITOR=${VISUAL}

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
    # -- When the boss comes around to look busy.
    # .. ref: https://www.commandlinefu.com/commands/view/6663/pretend-to-be-busy-in-office-to-enjoy-a-cup-of-coffee
    # .. CTRL+c to quit.

    cat /dev/urandom                                                          \
    | hexdump -C                                                              \
    | grep --color=always 'ca fe'

    # -- v. 2021-04-27 13:46:04 UTC
} #--{ function:FIN }

fuck() {
    # -- Repeat last cmd with sudo if forgotten.

    sudo $(history -p !!)

    # -- v. 2021-04-27 13:52:55 UTC
} #--{ function:FIN }

#----------{ SOURCING }

  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  [ -f ~/.extrarc ] && source ~/.extrarc
  [ -f ~/.egorc ] && source ~/.egorc

# vim: syntax=sh
#--{ file:fin }----------------------------------------------------------------
