## { alterEGO Linux: "Open the vault of knowledge" }---------------------------
##
## .profile
##   created        : 2021-04-28 14:59:01 UTC
##   updated        : 2021-09-01 10:21:29 UTC
##   description    : Loaded in non interactive shell. 
##   app            : sh
##   target         : ${HOME}/.profile
## ____________________________________________________________________________

  [ -f ${HOME}/.alterEGO/.envrc ] && . ${HOME}/.alterEGO/.envrc
  [ -f ${HOME}/.alterEGO/.egorc ] && . ${HOME}/.alterEGO/.egorc
  [ -f ${HOME}/.alterEGO/.functions ] && . ${HOME}/.alterEGO/.functions
  [ -f ${HOME}/.alterEGO/.extrarc ] && . ${HOME}/.alterEGO/.extrarc

# vim: syntax=sh
## { FIN }_____________________________________________________________________
