---
geometry: "left=3cm,right=3cm,top=2cm,bottom=2cm"
---

# AltrEGO Linux

## Application

### bash-completion

```
bash-completion
  package          : extra/bash-completion
  url              : https://github.com/scop/bash-completion
  description      : Programmable completion for the bash shell
```

### docker

```
```

### dos2unix

```
dos2unix
  package          : community/dos2unix
  url              : https://waterlan.home.xs4all.nl/dos2unix.html
  man              : dos2unix(1)
  description      : Converts DOS/Windows and MAC OS text files format to Unix,
                     especially line breaks.
  mode             : minimal
```

### dunst

For the graphical notification and messages.

```
dunst
  package         : community/dunst
  url             : https://dunst-project.org/
  description     : Customizable and lightweight notification-daemon
  mode            : nice
```

### easy-rsa

```
```

### openvpn

```
openvpn
  package          : extra/openvpn
  description      : An easy-to-use, robust and highly configurable VPN 
                     (Virtual Private Network)
  url              : https://openvpn.net/index.php/open-source.html
```

### pandoc

Requires pdflatex in order to convert md to pdf.

```
$ sudo pacman -S texlive-core
$ pacman -Qo pdflatex
/usr/bin/pdflatex is owned by texlive-bin 2021.58686-3
```

### tcpdump

```
tcpdump
  package          : extra/tcpdump
  url              : https://www.tcpdump.org/
  description      : Powerful command-line packet analyzer
```

<p><em>ref.</em> Daniel Miessler, <a href="https://danielmiessler.com/study/tcpdump/" target="_blank">"A tcpdump Tutorial with Examples — 50 Ways to Isolate Traffic"</a>.</p>

### tor-browser

```
tor-browser
  package          : aur/tor-browser
  url              : https://www.torproject.org/projects/torbrowser.html
  description      : Tor Browser Bundle: anonymous browsing using Firefox and Tor (international PKGBUILD)
```

Questions:
  - Is size matter in i3vm? => Open as float?

### Interesting
  - android-file-transfer
  - doublecmd-qt5
  - pcmanfm-gtk3
  - ttf-joypixels
  - ttf-unifont
  - bumblebee-status

## Configuration files

As per comment in [https://apple.stackexchange.com/questions/12993/why-doesnt-bashrc-run-automatically](https://apple.stackexchange.com/questions/12993/why-doesnt-bashrc-run-automatically#comment13715_13019):

>" By default, Terminal starts the shell via /usr/bin/login, which makes the shell a login shell. On every platform (not just Mac OS X) bash does not use .bashrc for login shells (only /etc/profile and the first of .bash_profile, .bash_login, .profile that exists and is readable). This is why “put source ~/.bashrc in your .bash_profile” is standard advice. – Chris Johnsen Apr 28 '11 at 4:21 "

To ensure a consistency while sourcing the shell configuration files, `.bashrc` and `.profile` will check if one another is sourced and source each other if need be. Otherwise, `.bashrc` isn't available if in login shell and `.profile` not sourced when opening xfce4-terminal or opening a shell from thunar.

~/.bashrc
~/.profile

~/.alterEGO/.egorc

Special shell environment and stuff for alterEGO Linux.

~/.alterEGO/.extrarc

~/.alterEGO/.functions

~/.alterEGO/.tryhackmerc
~/.alterEGO/.tryhackme.conf

Shell commands for TryHackMe.com
  - attack
  - attack start
  - attack set-player
  - attack set-room
  - attack set-rhost

### ~/.vimrc

### ~/.xinitrc

## Keyboard mapping

| APPS         | KEYS                        | DESCRIPTION                                                               |
| :----------- | :-------------------------- | :------------------------------------------------------------------------ |
| i3           | MOD+SHIFT+q                 | Kill focused window                                                       |
| i3           | MOD+h                       | Change focus left                                                         |
| i3           | MOD+j                       | Change focus down                                                         |
| i3           | MOD+k                       | Change focus up                                                           |
| i3           | MOD+l                       | Change focus right                                                        |
| i3           | MOD+SHIFT+h                 | Move window left                                                          |
| i3           | MOD+SHIFT+j                 | Move window down                                                          |
| i3           | MOD+SHIFT+k                 | Move window up                                                            |
| i3           | MOD+SHIFT+l                 | Move window right                                                         |
| i3           | MOD+t                       | Split window toggle                                                       |
| i3           | MOD+s                       | Layout -> stacking                                                        |
| i3           | MOD+w                       | Layout -> tabbed                                                          |
| i3           | MOD+e                       | Layout toggle between stacking and tabbed                                 |
| i3           | MOD+r                       | Resize window. Use hjkl or arrows to resize, ESC to return to normal mode |
| i3           | MOD+SHIFT+SPACE             | Floating window toggle                                                    |
| i3           | MOD+SHIFT+s                 | Makes floating window sticky (toggle)                                     |
| i3           | MOD+SHIFT+-                 | Window -> Scratchpad (toggle)                                             |
| i3           | MOD+-                       | Scratchpad show/hide (toggle)                                             |
| i3           | MOD+SHIFT+c                 | Reload i3 config                                                          |
| i3           | MOD+SHIFT+r                 | Restart i3                                                                |
| i3           | MOD+SHIFT+e                 | Exit i3                                                                   |
| i3           | MOD+CTRL+l                  | Keyboard language: toggle_language.sh (toggle)                            |
| i3           | MOD+CTRL+s                  | Screenshot: screenshot.sh --window                                        |
| i3           | MOD+RETURN                  | Opens new terminal with tmux                                              |
| i3           | MOD+b                       | Bookmarks: bookmarks.py                                                   |
| i3           | MOD+m                       | EGOmenu: EGOmenu.py                                                       |
| vim          | CTRL+f                      | Find in document (requires fzf.vim)                                       |
| vim          | CTRL+l                      | To lowercase                                                              |
| vim          | CTRL+o                      | List and open files in $HOME                                              |
| vim          | CTRL+s                      | Saves just like on Window!                                                |
| vim          | CTRL+u                      | To UPPERCASE                                                              |
| vim          | F3                          | Toggle search highlighting                                                |
| vim          | F4                          | ToggleNetrw() File Explorer                                               |
| vim          | F5                          | Toggle spellchecker                                                       |
| vim          | F7                          | Copy selection to clipboard (requires xclip)                              |
| vim          | F9                          | Insert UTC timestamp as ID                                                |
| vim          | F12                         | Insert UTC timestamp                                                      |
| vim          | LEADER+c                    | CommentToggle()                                                           |
| vim          | LEADER+cs                   | Clear search highlighting                                                 |
| vim          | LEADER+ev                   | Edit $MYVIMRC in a new tab                                                |
| vim          | LEADER+hc                   | Clear lines highlights                                                    |
| vim          | LEADER+hl                   | Highlights current line.                                                  |
| vim          | LEADER+hp                   | View python documentation of current word                                 |
| vim          | LEADER+k                    | View man page of current word                                             |
| vim          | LEADER+ln                   | Toggle line numbering                                                     |
| vim          | LEADER+ls                   | List and open files in Buffer (requires fzf.vim)                          |
| vim          | LEADER+os                   | List and open files in / (requires fzf.vim)                               |
| vim          | LEADER+p                    | RunPython()                                                               |
| vim          | LEADER+so                   | Source $MYVIMRC                                                           |
| vim          | LEADER+ss                   | Kill script running in tmux -t 1                                          |
| vim          | LEADER+sx                   | Toggle Syntastic (requires syntastic plugin)                              |
| vim          | LEADER+w                    | Toggle line wrap                                                          |
| vim          | SHIFT+F7                    | Paste selection from clipboard (requires xclip)                           |
| vim          | ,,                          | Same as ESC                                                               |
| vim          | LEADER+64                   | Decode base64 inplace                                                     |

## Shell aliases and functions

| NAME                       | FILE                | DESCRIPTION                                                                                        |
| :------------------------- | :---------------    | :--------------------------------------------------------------                                    |
| attack                     | .egorc              | Sources and run ~/.alterEGO/.tryhackmerc. Usage: `attack --help`                                   |
| dvwa                       | .egorc              | [start, stop] Damn Vulnerable Web App (DVWA) docker.                                               |
| juiceShop                  | .egorc              | [start, stop] OWASP Juice Shop docker.                                                             |
| goto                       | .egorc              | Uses ~/.alterEGO/.goto @&lt;bookmarks>. Ex. `goto @wordlists` == `cd /usr/local/share/wordlists`   |
| ipaddr                     | .egorc              | Exports $IPLOC and $IPPUB. Run `ipaddr` to refresh those variables.                                |
| msfconsole                 | .egorc              | `msfconsole -x "db_connect ${USER}@msf"`                                                           |
| nmapBasic                  | .egorc              | `sudo grc nmap -sV -O -sC --traceroute` &lt;ip address>                                            |
| $THM\_PLAYER               | .tryhackmerc        |                                                                                                    |
| $THM\_ROOM                 | .tryhackmerc        |                                                                                                    |
| $THM\_RHOST                | .tryhackmerc        |                                                                                                    |
| $THM\_LHOST                | .tryhackmerc        |                                                                                                    |
| $THM\_MAINDIR              | .tryhackmerc        |                                                                                                    |
| $THM\_PATH                 | .tryhackmerc        | $THM\_MAINDIR/$THM\_ROOM                                                                         |
| $THM\_TOOLS                | .tryhackmerc        | $THM\_MAINDIR/tools                                                                              |
| $WORDLISTS                 | .egorc              | /usr/local/share/wordlists                                                                         |
| $WL\_BEST1050              | .egorc              | /usr/local/share/wordlists/best1050.txt                                                            |
| $WL\_BIG                   | .egorc              | /usr/local/share/wordlists/seclist-big.txt                                                         |
| $WL\_DIRMEDIUM             | .egorc              | /usr/local/share/wordlists/directory-list-2.3-medium.txt                                           |
| $WL\_ROCKYOU               | .egorc              | /usr/local/share/wordlists/rockyou.txt                                                             |
| $WL\_LARGEFILES            | .egorc              | /usr/local/share/wordlists/raft-large-files.txt                                                    |
| $WL\_XPLATFORM             | .egorc              | /usr/local/share/wordlists/xplatform.txt                                                           |
| $REVSHELLS                 | .egorc              | /usr/local/share/reverse\_shells                                                                    |
| $RS\_PATT\_NODEJS            | .egorc              | /usr/local/share/reverse\_shells/patt\_nodeJS.js                                                     |
| $RS\_REVSHELL\_PHP           | .egorc              | /usr/local/share/reverse\_shells/php-reverse-shell.php                                              |
| $RS\_WEBSHELL               | .egorc              | /usr/local/share/reverse\_shells/webshell.php                                                       |
| busy                       | .functions          |                                                                                                    |
| cheat                      | .functions          |                                                                                                    |
| cleanHistory               | .functions          |                                                                                                    |
| delete                     | .functions          |                                                                                                    |
| dirSize                    | .functions          |                                                                                                    |
| docker666                  | .functions          | [start|stop] docker.service                                                                        |
| dockerStats                | .functions          |                                                                                                    |
| fixout                     | .functions          |                                                                                                    |
| fuck                       | .functions          |                                                                                                    |
| gitall                     | .functions          |                                                                                                    |
| pyclean                    | .functions          |                                                                                                    |
| gitstatus                  | .functions          |                                                                                                    |
| heraser                    | .functions          |                                                                                                    |
| ispeed                     | .functions          |                                                                                                    |
| nowutc                     | .functions          |                                                                                                    |
| pywebserver                | .functions          |                                                                                                    |
| tagalog                    | .functions          |                                                                                                    |
| translate                  | .functions          |                                                                                                    |
| tunsrc                     | .functions          | Display all tun interface with IP, PID and name                                                    |
| viewips                    | .functions          |                                                                                                    |
| open                       | .bashrc             | `xdg-open`                                                                                         |
| ports                      | .functions          | is `sudo netstat -tulanp`                                                                          |
| psbasic                    | .functions          | is `ps aux`                                                                                        |
| psgrep                     | .functions          | `ps aux | grep -Ei $@`                                                                             |

## Collection

### George Orwell (1949), "Nineteen Eighty-Four"
    Title: Nineteen Eighty-Four
    Author: Orwell, George [Blair, Eric Arthur] (1903-1950)
    Date of first publication: 1949
    Edition used as base for this ebook: London: Secker & Warburg; Toronto: S. J. Reginald Saunders, 1949
    Date first posted: 23 May 2012
    Date last updated: 23 May 2012
    Project Gutenberg Canada ebook #949
    url: http://gutenberg.ca/ebooks/orwellg-nineteeneightyfour/orwellg-nineteeneightyfour-00-h.html

## Web Browser + plugins

### CSSViewer

```
CSSViewer
  description      : A simple yet powerful CSS property viewer.
  author           : Mohsen Khanpour
  url              : https://github.com/mohsenkhanpour/CSSViewer
  mozilla add-ons  : https://addons.mozilla.org/en-US/firefox/addon/cssviewer-quantum/
```
