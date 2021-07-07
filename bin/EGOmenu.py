#!/usr/bin/env python
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# EGOmenu.py
#   created     : 2021-06-28 11:42:57 UTC
#   updated     : 2021-07-06 12:32:17 UTC
#   description : EGO menu using FZF.
#   dependencies: - fzf
#------------------------------------------------------------------------------

import random
import shlex
import subprocess
from collections import namedtuple
from time import sleep

MenuOption = namedtuple('MenuOption', ['name', 'run', 'cmd', 'session', 'description', 'is_floating'])

options = [
    MenuOption('arp-scan local', 'stay_in_terminal', 'sudo arp-scan; read -p \'\nWould you like to scan the local network? \' REPLY; if [[ \$REPLY =~ ^([yY][eE][sS]|[yY])$ ]]; then sudo arp-scan --localnet; else :; fi', 'ARPSCAN', 'MAC Address scan.', True),
    MenuOption('burp suite', 'launch', 'burpsuite', 'BURP', 'Web applications security testing.', False),
    MenuOption('bookmarks', 'terminal', 'bookmarks.py', 'BOOKMARKS', 'Bookmarks manager.', True),
    MenuOption('change background/wallpaper', 'launch', 'ego-background.sh', 'null', 'Change wallpapers', False),
    MenuOption('dirbuster', 'stay_in_terminal', 'dirbuster --help', 'DIRBUSTER', 'Description', False),
    MenuOption('exit i3', 'execute', 'i3-msg exit', 'null', 'Exit i3 window manager.', False),
    MenuOption('firefox', 'launch', 'firefox', 'FIREFOX', 'Web browser.', False),
    MenuOption('firefox --private', 'launch', 'firefox --private-window', 'SHUTTT', 'Web browser, private session.', False),
    MenuOption('gobuster', 'stay_in_terminal', 'gobuster --help', 'GOBUSTER', 'Description', False),
    MenuOption('htop', 'terminal', 'htop', 'HTOP', 'Description', True),
    MenuOption('john', 'stay_in_terminal', 'john --help', 'JOHN', 'John the Ripper password cracker.', False),
    MenuOption('metasploit', 'stay_in_terminal', 'msfconsole', 'METASPLOIT', 'Penetration testing framework.', False),
    MenuOption('netcat', 'stay_in_terminal', 'nc --help', 'NETCAT', 'Utility for network discovery and security auditing.', False),
    MenuOption('nmap', 'stay_in_terminal', 'nmap --help | more', 'NMAP', 'Network exploration tool and security / port scanner.', False),
    MenuOption('nmap NSE', 'terminal', '/usr/local/bin/nmapNSE.sh', 'NMAPNSE', 'Nmap Scripting Engine (NSE) scripts', True),
    MenuOption('pavucontrol', 'launch', 'pavucontrol', 'PAVU', 'Volume control.', False),
    MenuOption('public IP', 'launch', 'curl --silent http://ipecho.net/plain | xclip -selection clipboard', 'PUBIP', 'Get your public IP > clipboard.', False),
    MenuOption('ranger', 'terminal', 'ranger', 'RANGER', 'TUI file manager.', False),
    MenuOption('reboot', 'execute', 'reboot', 'null', 'Description', False),
    MenuOption('remmina', 'launch', 'remmina', 'REMMINA', 'Description', False),
    MenuOption('scout man pages', 'terminal', 'scout_man.py', 'null', 'Description', False),
    MenuOption('scout python modules', 'terminal', 'scout_pymodules.py', 'null', 'Description', False),
    MenuOption('shrug', 'launch', 'echo -n \'¯\_(ツ)_/¯\' | xclip -selection clipboard', 'null', '¯\_(ツ)_/¯ > clipboard', False),
    MenuOption('shutdown', 'execute', 'shutdown now', 'null', 'Description', False),
    MenuOption('sqlitebrowser', 'launch', 'sqlitebrowser', 'SQLB', 'Sqlite GUI browser', False),
    MenuOption('star wars', 'stay_in_terminal', 'telnet towel.blinkenlights.nl', 'STARWARS', 'Watch ASCII StarWars.', False),
    MenuOption('thumbs up!', 'launch', 'echo -n \'👍\' | xclip -selection clipboard', 'THUMBSUP', '👍 > clipboard', True),
    MenuOption('thunar', 'launch', 'thunar', 'THUNAR', 'GUI File manager.', False),
    MenuOption('thunar for admin', 'launch', 'sudo thunar', 'THUNARROOT', 'GUI File manager, elevated priviledges.', False),
    MenuOption('tmux attach', 'terminal', 'tmuxplus.sh -a', 'ATTACH', 'List Tmux sessions and attach.', True),
    MenuOption('view history', 'stay_in_terminal', 'cat ${HOME}/.bash_history | fzf', 'HISTORY', 'View latest bash history.', True),
    MenuOption('volume', 'launch', 'pavucontrol', 'VOLUME', 'Volume control.', False),
    MenuOption('wireshark', 'launch', 'sudo wireshark', 'WIRESHARK', 'Network traffic analyser.', False),
    ]

def main():

    #### Menu options generator.
    opt = ''.join([f"{o.name:<40}{o.description}\n" for o in options]).encode('UTF-8')

    menu = subprocess.run(['fzf', '--reverse'], input=opt, stdout=subprocess.PIPE)

    for o in options:
        if o.name == menu.stdout.decode('UTF-8').split('  ')[0].strip():
            selection = o

            add_float = ''
            command = selection.cmd
            session = f"{selection.session}{random.randint(0, 10000)}"
            if selection.is_floating is True:
                add_float = f"&& i3-msg \"[id=$(xdotool getactivewindow)] floating enable, resize set 800px 500px, move position center\""

            if selection.run == 'execute':
                subprocess.run(f"{command} {add_float}", shell=True)
            elif selection.run == 'launch':
                subprocess.run(f"tmux new-session -d -s {session}", shell=True)
                sleep(0.5)
                subprocess.run(f"tmux send-keys -t {session} \"nohup {command} >/dev/null 2>&1 & disown && exit\" enter {add_float}", shell=True)
            elif selection.run == 'stay_in_terminal':
                subprocess.run(f"tmux new-session -d -s {session}", shell=True)
                sleep(0.5)
                subprocess.run(f"tmux send-keys -t {session} \"{command}\" enter", shell=True)
                subprocess.run(f"xfce4-terminal --hide-scrollbar --hide-menubar --hide-toolbar --command=\"env TERM=screen-256color tmux -u a -t '{session}'\" {add_float}", shell=True)
            elif selection.run == 'terminal':
                subprocess.run(f"xfce4-terminal --hide-scrollbar --hide-menubar --hide-toolbar --command=\"{command}\" {add_float}", shell=True)

if __name__ == '__main__':
    main()

#--{ file:FIN }----------------------------------------------------------------
