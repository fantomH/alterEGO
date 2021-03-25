## Installed packages + applications

### arp-scan

    NAME            : arp-scan
    DESCRIPTION     : A tool that uses ARP to discover and fingerprint IP hosts on the local network
    URL             : https://github.com/royhills/arp-scan
    REPOSITORY      : ArchLinux/community

### Burp Suite

    NAME            : burpsuite
    DESCRIPTION     : An integrated platform for performing security testing of web applications (free edition)
    URL             : https://portswigger.net/burp/
    REPOSITORY      : https://aur.archlinux.org/packages/burpsuite

### Dirbuster

    NAME            : dirbuster
    DESCRIPTION     : An application designed to brute force directories and files names on web/application servers
    URL             : http://www.owasp.org/index.php/Category:OWASP_DirBuster_Project
    REPOSITORY      : https://aur.archlinux.org/packages/dirbuster

### Gobuster

    NAME            : gobuster-git
    DESCRIPTION     : A directory/file & DNS busting tool.
    URL             : https://github.com/OJ/gobuster
    REPOSITORY      : https://aur.archlinux.org/packages/gobuster-git

### gpg

    NAME            : gpg
    PKG OWNER       : gnupg
    DESCRIPTION     : OpenPGP encryption and signing tool.
    URL             : https://www.gnupg.org/
    REPOSITORY      : ArchLinux/core

### John

    NAME            : john
    DESCRIPTION     : John the Ripper password cracker
    URL             : https://www.openwall.com/john
    REPOSITORY      : ArchLinux/community

    USEFUL          : - gpg2john

### Metasploit

    NAME            : metasploit
    DESCRIPTION     : Advanced open-source platform for developing, testing, and using exploit code
    URL             : https://www.metasploit.com/
    REPOSITORY      : ArchLinux/community

### Nmap

    NAME            : nmap
    DESCRIPTION     : Utility for network discovery and security auditing
    URL             : https://nmap.org/
    REPOSITORY      : ArchLinux/extra

### Nikto

    NAME            : nikto
    DESCRIPTION     : A web server scanner which performs comprehensive tests against web servers for multiple items
    URL             : https://github.com/sullo/nikto
    REPOSITORY      : ArchLinux/community

### SQLiteBrowser

    NAME            : sqlitebrowser
    DESCRIPTION     : SQLite Database browser is a light GUI editor for SQLite databases, built on top of Qt
    URL             : https://sqlitebrowser.org/
    REPOSITORY      : ArchLinux/community

### SQLmap

    NAME            : sqlmap
    DESCRIPTION     : Automatic SQL injection and database takeover tool
    URL             : http://sqlmap.org
    REPOSITORY      : ArchLinux/community

  - TEST ON: Known Vulns @ https://tryhackme.com/room/owasptop10 [Task 29]

### Wfuzz

    NAME            : wfuzz-git
    DESCRIPTION     : Web application fuzzer - python3 build of the dev branch
    URL             : https://github.com/xmendez/wfuzz
    REPOSITORY      : https://aur.archlinux.org/packages/wfuzz-git

### Wireshark

    NAME            : wireshark-qt
    DESCRIPTION     : Network traffic and protocol analyzer/sniffer - Qt GUI
    URL             : https://www.wireshark.org/
    REPOSITORY      : ArchLinux/community

## Wordlists
Wordlists are found in /usr/local/share/wordlist/.

### SecLists

#### best1050.txt
https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/best1050.txt
List of 1050 common password. 

### Others

#### Rockyou.txt

## Scripts

### bookmarks.py

    NAME            : bookmarks.py
    ORIGIN          : alterEGO

### EGOmenu.sh

    NAME            : EGOmenu.sh
    ORIGIN          : alterEGO

### Hash Identifier

    NAME            : hash-id.py
    URL             : https://gitlab.com/kalilinux/packages/hash-identifier/
    ORIGIN          : https://gitlab.com/kalilinux/packages/hash-identifier/-/raw/kali/master/hash-id.py

### Linpeas

    NAME            : linpeas.sh
    URL             : https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS
    ORIGIN          : https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh

#----------{ NOTES }

#-----[ TO EXPLORE ]

  - From THM encryptioncrypto101 for RSA stuff:
    - https://github.com/Ganapati/RsaCtfTool
    - https://github.com/ius/rsatool

<!--{ file:fin }............................................................-->
