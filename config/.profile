## { alterEGO Linux: "Open the vault of knowledge" }---------------------------
##
## .profile
##   created        : 2021-04-28 14:59:01 UTC
##   updated        : 2021-08-31 21:51:58 UTC
##   description    : Loaded in non interactive shell. 
##   app            : sh
##   target         : ${HOME}/.profile
## ____________________________________________________________________________

  [ -f ${HOME}/.alterEGO/.envrc ] && . ${HOME}/.alterEGO/.envrc
  [ -f ${HOME}/.alterEGO/.egorc ] && . ${HOME}/.alterEGO/.egorc
  [ -f ${HOME}/.alterEGO/.extrarc ] && . ${HOME}/.alterEGO/.extrarc
  [ -f ${HOME}/.alterEGO/.functions ] && . ${HOME}/.alterEGO/.functions

# vim: syntax=sh
## { FIN }_____________________________________________________________________
