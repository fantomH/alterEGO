#!/usr/bin/env bash

#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# toggle_connection.sh
#   created     : 2021-06-28 11:42:57 UTC
#   updated     : 2021-07-19 01:44:44 UTC
#   description : Open and close internet connection.
#   dependencies: nmcli, notify-send
#
#------------------------------------------------------------------------------

if [[ "$(nmcli networking)" = "enabled" ]]; then
    nmcli networking off                                                      \
    && notify-send "Killed Internet..."
    sleep 1.5
    killall notify-osd
else
    nmcli networking on                                                       \
    && notify-send "Connected to Internet..."
    sleep 1.5
    killall notify-osd
fi

#--{ file:FIN }----------------------------------------------------------------
