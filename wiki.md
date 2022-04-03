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

## Web Browser + plugins

### CSSViewer

```
CSSViewer
  description      : A simple yet powerful CSS property viewer.
  author           : Mohsen Khanpour
  url              : https://github.com/mohsenkhanpour/CSSViewer
  mozilla add-ons  : https://addons.mozilla.org/en-US/firefox/addon/cssviewer-quantum/
```
