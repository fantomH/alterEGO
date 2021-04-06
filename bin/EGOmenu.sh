#!/usr/bin/env bash
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# EGOmenu.sh:
#   created:       '2021-03-12 19:49:39 UTC'
#   updated:       '2021-04-06 01:20:51 UTC'
#   description:   'EGO menu using FZF.' 
#   dependencies:
#     - fzf
#
#------------------------------------------------------------------------------

  _TERMINAL="xfce4-terminal --hide-scrollbar --hide-menubar --hide-toolbar"
  _field_sep=";;"

#----------{ MENU LIST }
# -- List the application here.
# .. APP_NAME|FUNCTION|COMMAND|SESSION/TITLE

_list="\
burp suite;;tmux_background;;burpsuite;;BURP
exit i3;;execute;;i3-msg exit;;null
firefox;;tmux_background;;firefox;;FIREFOX
firefox --private;;tmux_background;;firefox --private-window;;SHUTTT
htop;;terminal;;htop;;null
ranger;;terminal;;ranger;;RANGER
reboot;;execute;;reboot;;null
remmina;;tmux_background;;remmina;;REMMINA
shrug;;execute;;echo '¯\_(ツ)_/¯';;null
shutdown;;execute;;shutdown now;;null
sqlitebrowser;;tmux_background;;sqlitebrowser;;SQLB
star wars;;terminal;;telnet towel.blinkenlights.nl;;null
thunar;;tmux_background;;thunar;;THUNAR
thunar for admin;;tmux_background;;sudo thunar;;SUDOTHUNAR
view history;;execute;;cat ${HOME}/.bash_history | fzf;;null
wireshark;;tmux_background;;sudo wireshark;;WIRESHARK
"

#----------{ FUNCTIONS }

function terminal() {
  $_TERMINAL --command="$cmd"
} #--{ func:fin }

function tmux_background() {
  # -- Sends commands to a detached session.
  # .. Most of the time will detach the process from the terminal and exit
  # .. tmux session. Useful to start a GUI application.

  tmux new-session -d -s ${session}
  sleep 0.5
  tmux send-keys -t ${session} "nohup ${cmd} >/dev/null 2>&1 & disown && exit" enter
} #--{ func:fin }

#----------{ MENU }

_selection=$(for app in "$(awk -F ';;' '{print $1}' <<< ${_list})"; do        \
                 echo "${app}";                                               \
             done                                                             \
             | fzf --reverse) 
[[ -z ${_selection} ]]

_config=$(grep -E "^${_selection};;" <<< "${_list}") 
_run=$(awk -F ';;' '{print $2}' <<< ${_config})

case $_run in

    execute )
        cmd=$(awk -F ';;' '{print $3}' <<< "${_config}")
        eval $cmd
        ;;

    terminal )
        cmd=$(awk -F ';;' '{print $3}' <<< "${_config}")
        terminal
        ;;

    tmux_background )
        session="$(awk -F ';;' '{print $4}' <<< "${_config}")${RANDOM}"
        cmd="$(awk -F ';;' '{print $3}' <<< "${_config}")"
        tmux_background
        ;;

    * )
        firefox https://www.youtube.com/watch?v=Z829a7GyHyQ &
        ;;

esac

#--{ file:fin }----------------------------------------------------------------
