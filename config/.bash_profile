## { alterEGO Linux: "Open the vault of knowledge" }---------------------------
##
## .bash_profile
##   created        : 2019-04-07 03:57:21 UTC
##   updated        : 2021-08-31 21:46:31 UTC
##   description    : bash init file. 
##   application    : bash
##   target         : ${HOME}/.bash_profile
## ____________________________________________________________________________

  [[ -f ${HOME}/.profile ]] && source ${HOME}/.profile

  case $- in *i*) source ${HOME}/.bashrc;; esac

# vim: syntax=sh
## { FIN }_____________________________________________________________________
