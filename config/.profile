## { alterEGO Linux: "Open the vault of knowledge" }---------------------------
##
## .profile
##   created        : 2021-04-28 14:59:01 UTC
##   updated        : 2021-09-15 11:00:31 UTC
##   description    : Loaded in non interactive shell. 
##   app            : sh
##   target         : ${HOME}/.profile
## ____________________________________________________________________________

  [ -f ${HOME}/.alterEGO/.egorc ] && . ${HOME}/.alterEGO/.egorc
  [ -f ${HOME}/.alterEGO/.functions ] && . ${HOME}/.alterEGO/.functions
  [ -f ${HOME}/.alterEGO/.extrarc ] && . ${HOME}/.alterEGO/.extrarc

## [ LOADED ]

  function loaded_profile() {
    printf "${COLOR_GREEN}[+]${COLOR_RESET} ${COLOR_BOLD}.profile loaded @ $(date | sed 's/  / /g')...${COLOR_RESET}\n"
  }
  # loaded_profile

  if [ ! $(command -v loaded_bashrc) ]; then
    [ -f ${HOME}/.bashrc ] && . ${HOME}/.bashrc
  fi

## [ RELOAD ]

  function reload_profile() {
    source "${HOME}/.profile"
    loaded_profile
  }

# vim: syntax=sh
## { FIN }_____________________________________________________________________
