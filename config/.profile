## { alterEGO Linux: "Open the vault of knowledge" } ----------------------- ##
##                                                                           ##
## .profile                                                                  ##
##   created        : 2021-04-28 14:59:01 UTC                                ##
##   updated        : 2021-09-26 12:03:52 UTC                                ##
##   description    : Loaded in non interactive shell.                       ##
##   app            : sh                                                     ##
##   target         : ${HOME}/.profile                                       ##
## _________________________________________________________________________ ##

  [ -f ${HOME}/.alterEGO/.egorc ] && . ${HOME}/.alterEGO/.egorc
  [ -f ${HOME}/.alterEGO/.functions ] && . ${HOME}/.alterEGO/.functions
  [ -f ${HOME}/.alterEGO/.extrarc ] && . ${HOME}/.alterEGO/.extrarc

## [ LOADED ] -------------------------------------------------------------- ##

  function loadedProfile() {
    printf '%b\n' "${COLOR_GREEN}[+]${COLOR_RESET} ${COLOR_BOLD}.profile loaded @ $(date | sed 's/  / /g')...${COLOR_RESET}"
  }
  # loadedProfile

  if [ ! $(command -v loadedBashrc) ]; then
    [ -f ${HOME}/.bashrc ] && . ${HOME}/.bashrc
  fi

## [ RELOAD ] -------------------------------------------------------------- ##

  function reloadProfile() {
    source "${HOME}/.profile"
    loadedProfile
  }

# vim: syntax=sh
## FIN _____________________________________________________________ ¯\_(ツ)_/¯
