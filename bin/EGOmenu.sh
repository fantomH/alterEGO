#!/usr/bin/env bash
#--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# EGOmenu.sh:
#   created:       '2021-03-12 19:49:39 UTC'
#   updated:       '2021-03-12 22:30:41 UTC'
#   description:   'EGO menu using FZF.' 
#   dependencies:
#     - fzf
#
#------------------------------{ alterEGO Linux }------------------------------

#----------{ MENU LIST }
# -- List the application here.
# .. APP_NAME|FUNCTION|COMMAND|SESSION/TITLE

_list="\
Burp Suite|tmux_background|burpsuite|BURP
Firefox|tmux_background|firefox|FIREFOX
Firefox --private|tmux_background|firefox --private-window|SHUTTT
"

#----------{ FUNCTIONS }

function tmux_background() {
  # -- Sends commands to a detached session.
  # .. Most of the time will detach the process from the terminal and exit
  # .. tmux session. Useful to start a GUI application.

  tmux new-session -d -s ${session}
  sleep 0.5
  tmux send-keys -t ${session} "nohup ${cmd} & disown && exit" enter
} #--{ func:fin }

#----------{ FZF MENU }

_selection=$(for app in "$(awk -F '|' '{print $1}' <<< ${_list})"; do echo "${app}"; done                  \
        | fzf) 
[[ -z ${_selection} ]]

_config=$(grep -E "^${_selection}\|" <<< "${_list}") 
_run=$(awk -F '|' '{print $2}' <<< ${_config})

case $_run in

    tmux_background )
        session="$(awk -F '|' '{print $4}' <<< "${_config}")${RANDOM}"
        cmd="$(awk -F '|' '{print $3}' <<< "${_config}")"
        tmux_background
        ;;

    * )
        firefox https://www.youtube.com/watch?v=Z829a7GyHyQ &
        ;;

esac

#--{ file:fin }----------------------------------------------------------------
