#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# .bash_profile
#   created        : 2019-04-07 03:57:21 UTC
#   updated        : 2021-04-29 14:37:42 UTC
#   description    : bash init file. 
#   application    : bash
#   target         : ${HOME}/.bash_profile
# -----------------------------------------------------------------------------

  if [[ ${ENVRC} != 'OK' ]]; then
      [[ -f ${HOME}/.config/environment/.envrc ]] && source ${HOME}/.config/environment/.envrc
  fi

  [[ -f ${HOME}/.bashrc ]] && source ${HOME}/.bashrc

# vim: syntax=sh
#--{ file:FIN }----------------------------------------------------------------
