#!/usr/bin/env bash

## { alterEGO Linux: "Open the vault of knowledge" } ----------------------- ##
##                                                                           ##
## ego-background.sh                                                         ##
##   created       : 2021-04-01 12:38:04 UTC                                 ##
##   updated       : 2021-10-03 12:48:17 UTC                                 ##
##   description   : Set and change backgrounds.                             ##
##   dependencies  : ['feh', 'sxiv']                                         ##
## _________________________________________________________________________ ##

  msg_action() {
    _msg="${1}"

    _msg_bold="\033[1m"
    _msg_green="\033[32m"
    _msg_reset="\033[0m"

    printf '%b\n' "${_msg_green}[*]${_msg_reset} ${_msg_bold}${_msg}${_msg_reset}"
    if [[ ${DISPLAY} ]]; then
      notify-send --urgency=normal "[*] ${_msg}"
    fi
  }

  msg_result() {
    _msg="${1}"

    _msg_bold="\033[1m"
    _msg_blue="\033[34m"
    _msg_reset="\033[0m"

    printf '%b\n' "${_msg_blue}[-]${_msg_reset} ${_msg_bold}${_msg}${_msg_reset}"
    if [[ ${DISPLAY} ]]; then
      notify-send --urgency=normal "[-] ${_msg}"
    fi
  }

  msg_warning() {
    _msg="${1}"

    _msg_bold="\033[1m"
    _msg_red="\033[31m"
    _msg_reset="\033[0m"

    printf '%b\n' "${_msg_red}[!]${_msg_reset} ${_msg_bold}${_msg}${_msg_reset}"
    if [[ ${DISPLAY} ]]; then
      notify-send --urgency=critical "[!] ${_msg}"
    fi
  }

  _passed_check='YES'
  for c in 'feh' 'sxiv'; do
    if [[ ! $(command -v "$c") ]]; then
      msg_warning "${c} is missing..."
      _passed_check='NO'
    fi
  done

  if [[ ${_passed_check} == 'YES' ]]; then
    if [[ ${1} == '--set' ]]; then
      if [[ ! -e ${HOME}/.fehbg ]]; then
        feh --bg-max --image-bg=black /usr/local/share/backgrounds/scary_hacker.jpg
      else
        ./.fehbg
      fi
    else
      ##### This script launches `sxiv` and shows alterEGO backgrounds.
      ##... Uses the 'mark' feature to output the name of the images to STDOUT.
      ##... To select a background, press 'm' and 'q' to quit.

      msg_action "(mq) to select or (q) to quit."

      bgdir="/usr/local/share/backgrounds"

      selection=$(sxiv -t ${bgdir} -o)

      feh --bg-max --image-bg=black ${selection}

      echo ${selection}
    fi
  else
    exit 1
  fi

## FIN _____________________________________________________________ ¯\_(ツ)_/¯
