#--{ ZmFudG9tSA==: "Open the vault of knowledge" }-----------------------------
#
# .xinitrc:
#   created:       '2021-02-23 02:54:43 UTC'
#   updated:       '2021-02-23 02:54:56 UTC'
#   description:   'Starts Window Manager with startx.' 
#------------------------------{ alterEGO Linux }------------------------------

# Executed by startx (run your window manager from here)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

exec /usr/bin/i3

#--{ file:fin }----------------------------------------------------------------
