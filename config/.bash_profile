#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# .bash_profile
#   created        : 2019-04-07 03:57:21 UTC
#   updated        : 2021-04-29 14:37:42 UTC
#   description    : bash init file. 
#   application    : bash
#   target         : ${HOME}/.bash_profile
# -----------------------------------------------------------------------------

  # -- Safeguard.
  # .. If .bash_profile exists, .profile isn't processed.

  # if [[ ${ENVRC} != 'OK' ]]; then
      # [[ -f ${HOME}/.config/environment/.envrc ]] && source ${HOME}/.config/environment/.envrc
  # fi

  # if [[ ${EGORC} != 'OK' ]]; then
      # [[ -f ${HOME}/.config/environment/.egorc ]] && source ${HOME}/.config/environment/.egorc
  # fi

  # if [[ ${EXTRARC} != 'OK' ]]; then
      # [[ -f ${HOME}/.config/environment/.extrarc ]] && source ${HOME}/.config/environment/.extrarc
  # fi
  [[ -f ${HOME}/.config/environment/.envrc ]] && source ${HOME}/.config/environment/.envrc
  [[ -f ${HOME}/.config/environment/.egorc ]] && source ${HOME}/.config/environment/.egorc
  [[ -f ${HOME}/.config/environment/.extrarc ]] && source ${HOME}/.config/environment/.extrarc


  # -- Sourcing .bashrc in case it is a login shell.
  [[ -f ${HOME}/.bashrc ]] && source ${HOME}/.bashrc

# vim: syntax=sh
#--{ file:FIN }----------------------------------------------------------------
