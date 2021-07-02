#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# EGOmenu.py
#   created     : 2021-06-28 11:42:57 UTC
#   updated     : 2021-07-01 14:52:58 UTC
#   description : EGO menu using FZF.
#   dependencies: - fzf
#------------------------------------------------------------------------------

import shlex
import subprocess
from collections import namedtuple
from time import sleep

MenuOption = namedtuple('MenuOption', ['name', 'run', 'cmd', 'session', 'is_floating'])

options = [
    MenuOption('arp-scan local', 'stay_in_terminal', 'sudo arp-scan; read -p \'\nWould you like to scan the local network? \' REPLY; if [[ \$REPLY =~ ^([yY][eE][sS]|[yY])$ ]]; then sudo arp-scan --localnet; else :; fi', 'ARPSCAN', True),
    MenuOption('burp suite', 'launch', 'burpsuite', 'BURP', False),
    MenuOption('bookmarks', 'terminal', 'bookmarks.py', 'BOOKMARKS', True),
    MenuOption('change background/wallpaper', 'launch', 'ego-background.sh', 'null', False),
    MenuOption('exit i3', 'execute', 'i3-msg exit', 'null', False),
    MenuOption('firefox --private', 'launch', 'firefox --private-window', 'SHUTTT', False),
    MenuOption('firefox', 'launch', 'firefox', 'FIREFOX', False),
    MenuOption('htop', 'terminal', 'htop', 'HTOP', True),
    MenuOption('pavucontrol', 'launch', 'pavucontrol', 'PAVU', False),
    MenuOption('ranger', 'terminal', 'ranger', 'RANGER', False),
    MenuOption('reboot', 'execute', 'reboot', 'null', False),
    MenuOption('remmina', 'launch', 'remmina', 'REMMINA', False),
    MenuOption('scout man pages', 'terminal', 'scout_man.py', 'null', False),
    MenuOption('scout python modules', 'terminal', 'scout_pymodules.py', 'null', False),
    MenuOption('shrug', 'stay_in_terminal', 'echo \'¯\_(ツ)_/¯\'', 'null', False),
    MenuOption('ls', 'stay_in_terminal', 'ls', 'null', True),
    MenuOption('shutdown', 'execute', 'shutdown now', 'null', False),
    MenuOption('sqlitebrowser', 'launch', 'sqlitebrowser', 'SQLB', False),
    MenuOption('star wars', 'stay_in_terminal', 'telnet towel.blinkenlights.nl', 'STARWARS', False),
    MenuOption('thunar for admin', 'launch', 'sudo thunar', 'SUDOTHUNAR', False),
    MenuOption('thunar', 'launch', 'thunar', 'THUNAR', False),
    MenuOption('tmux attach', 'terminal', 'tmuxplus.sh -a', 'ATTACH', True),
    MenuOption('view history', 'stay_in_terminal', 'cat ${HOME}/.bash_history | fzf', 'HISTORY', True),
    MenuOption('volume', 'launch', 'pavucontrol', 'VOLUME', False),
    MenuOption('wireshark', 'launch', 'sudo wireshark', 'WIRESHARK', False),
    ]

def main():

    #### Menu options generator.
    opt = ''.join([f"{o.name}\n" for o in options]).encode('UTF-8')

    menu = subprocess.run(['fzf', '--reverse'], input=opt, stdout=subprocess.PIPE)

    for o in options:
        if o.name == menu.stdout.strip().decode('UTF-8'):
            selection = o

            add_float = ''
            command = selection.cmd
            if selection.is_floating is True:
                add_float = f"&& i3-msg \"[id=$(xdotool getactivewindow)] floating enable, resize set 800px 500px, move position center\""

            if selection.run == 'execute':
                subprocess.run(f"{command} {add_float}", shell=True)
            elif selection.run == 'launch':
                subprocess.run(f"tmux new-session -d -s {selection.session}", shell=True)
                sleep(0.5)
                subprocess.run(f"tmux send-keys -t {selection.session} \"nohup {command} >/dev/null 2>&1 & disown && exit\" enter {add_float}", shell=True)
            elif selection.run == 'stay_in_terminal':
                subprocess.run(f"tmux new-session -d -s {selection.session}", shell=True)
                sleep(0.5)
                subprocess.run(f"tmux send-keys -t {selection.session} \"{command}\" enter", shell=True)
                subprocess.run(f"xfce4-terminal --hide-scrollbar --hide-menubar --hide-toolbar --command=\"env TERM=screen-256color tmux -u a -t '{selection.session}'\" {add_float}", shell=True)
            elif selection.run == 'terminal':
                subprocess.run(f"xfce4-terminal --hide-scrollbar --hide-menubar --hide-toolbar --command=\"{command}\" {add_float}", shell=True)

if __name__ == '__main__':
    main()

#--{ file:FIN }----------------------------------------------------------------
