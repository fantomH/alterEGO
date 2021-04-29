#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# .profile
#   created        : 2021-04-28 14:59:01 UTC
#   updated        : 2021-04-29 19:04:08 UTC
#   description    : User environment config file. 
#   app            : sh
#   target         : ${HOME}/.profile
#------------------------------------------------------------------------------

  [ -f ${HOME}/.config/environment/.envrc ] && . ${HOME}/.config/environment/.envrc
  [ -f ${HOME}/.config/environment/.egorc ] && . ${HOME}/.config/environment/.egorc

# vim: syntax=sh
#--{ file:FIN }----------------------------------------------------------------
