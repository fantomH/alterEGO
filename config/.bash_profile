## { alterEGO Linux: "Open the vault of knowledge" }---------------------------
##
## .bash_profile
##   created        : 2019-04-07 03:57:21 UTC
##   updated        : 2021-09-05 14:46:12 UTC
##   description    : bash init file. 
##   application    : bash
##   target         : ${HOME}/.bash_profile
## ____________________________________________________________________________

  [[ -f ${HOME}/.profile ]] && source ${HOME}/.profile

  case $- in *i*) source ${HOME}/.bashrc;; esac

## [ LOADED ]

  export ALTEREGO_BASH_PROFILE="LOADED"
  printf "${COLOR_GREEN}[+]${COLOR_RESET} ${COLOR_BOLD}.bash_profile loaded @ $(date)...${COLOR_RESET}\n"

  function reload_bash_profile() {
    source "${HOME}/.bash_profile"
  }

# vim: syntax=sh
## { FIN }_____________________________________________________________________
