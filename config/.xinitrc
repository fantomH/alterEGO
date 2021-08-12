# { alterEGO Linux: "Open the vault of knowledge" }
#
# .xinitrc
#   created     : 2021-02-23 02:54:43 UTC
#   updated     : 2021-08-12 17:20:24 UTC
#   description : Starts Window Manager with startx. 
#______________________________________________________________________________

# Executed by startx (run your window manager from here)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

case ${2} in

    qtile)
        exec /usr/bin/qtile start
        ;;
        
    *)
        exec /usr/bin/i3
        ;;

esac

# FILE: fin ________________________________________________________ ¯\_(ツ)_/¯
