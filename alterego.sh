#!/usr/bin/env bash
#--{ alterEGO Linux: "Open the vault of knowledge" }---------------------------
#
# alterego.sh:
#   created:       '2021-02-20 02:27:25 UTC'
#   updated:       '2021-04-11 12:15:08 UTC'
#   description:   'Create an AlterEGO/Arch Linux VM' 
#   dependencies:
#
#------------------------------------------------------------------------------

#----------{ VARIABLES }

  declare -r esc=$'\033'
  declare -r blue="${esc}[34m"
  declare -r green="${esc}[32m"
  declare -r red="${esc}[31m"
  declare -r reset="${esc}[0m"

  timezone="America/New_York"
  hostname="pc1"
  root_passwd="toor"
  user="ghost"
  user_passwd="password1"

  usr_local='/usr/local'
  git_local="${usr_local}/alterEGO"
  git_remote='https://github.com/fantomH/alterEGO.git'

#-----[ PARTITION ]

  # -- This uses sfdisk.
  # .. On the HOST, you can get the details with:
  # .. $ sudo sfdisk -d /dev/sda > sda.sfdisk
  # .. ref. https://superuser.com/questions/332252/how-to-create-and-format-a-partition-using-a-bash-script

  cat <<EOF | sfdisk /dev/sda
label: dos
device: /dev/sda
unit: sectors
sector-size: 512

/dev/sda1 : start=        2048, type=83, bootable
EOF

  # -- Formating & mounting partition.

  printf '%s\n' "${blue}:: Formating the partition...${reset}"
  printf '%s\n' " -> mkfs.ext4 /dev/sda1"
  mkfs.ext4 /dev/sda1
  sleep 1

  printf '%s\n' "${blue}:: Mounting the partition...${reset}"
  printf '%s\n' " -> mount /dev/sda1 /mnt"
  mount /dev/sda1 /mnt
  sleep 1

  printf '%s\n' "${blue}:: Creating $HOME...${reset}"
  printf '%s\n' " -> mkdir /mnt/home"
  mkdir /mnt/home
  sleep 1

#-----[ BASIC PACKAGES ]

  printf '%s\n' "${blue}:: Installing base packages...${reset}"
  pacstrap /mnt base base-devel git grub linux networkmanager pacman-contrib vim
  sleep 1

#-----[ FSTAB ]

  printf '%s\n' "${blue}:: Generating fstab...${reset}"
  genfstab -U /mnt >> /mnt/etc/fstab
  sleep 1

#-----[ ARCH-CHROOT ]

  # -- Creating a 'step 2' script in /mnt/root directory in order to run it
  # .. in arch-chroot.
  # .. ref. https://bbs.archlinux.org/viewtopic.php?id=204252

  cat <<EOF > /mnt/root/sysconfig.sh

    printf '%s\n' "${blue}:: Entering chroot...${reset}"
    sleep 1

  #-----[ alterEGO GIT ]

    printf '%s\n' "${blue}:: Cloning GIT repo...${reset}"
    cd ${usr_local}
    git clone ${git_remote}
    sleep 1
  
  #-----[ TIMEZONE and CLOCK ]

    printf '%s\n' "${blue}:: Setting timezone and time...${reset}"
    printf '%s\n' " -> Timezone to New York."
    ln -sf /usr/share/zoneinfo/${timezone} /etc/localtime
    timedatectl set-ntp true
    hwclock --systohc --utc
    printf '%s\n' " -> Time is now: $(date)."
    sleep 1

  #-----[ LOCALE ]

    printf '%s\n' "${blue}:: Generating locale...${reset}"
    printf '%s\n' " -> Will be set to en_US.UTF-8"
    sed -i "s/#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
    export LANG=en_US.UTF-8
    locale-gen
    sleep 1

  #-----[ NETWORK CONFIGURATION ]

    printf '%s\n' "${blue}:: Setting up network...${reset}"
    echo ${hostname} > /etc/hostname
    cat <<EOF2 > /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	${hostname}.localdomain	${hostname}
EOF2

    printf '%s\n' " -> Enabling NetworkManager daemon"
    systemctl enable NetworkManager.service
    sleep 1

  #-----[ POPULATING /etc/skel ]

    printf '%s\n' "${blue}:: Creating /etc/skel files...${reset}"
    cp -R ${git_local}/config/. /etc/skel/
    ls -a /etc/skel
    sleep 1

  #-----[ USERS and PASSWORDS ]

    printf '%s\n' "${blue}:: Configuring users and passwords...${reset}"
    printf "${root_passwd}\n${root_passwd}\n" | passwd
    sleep 1

    printf '%s\n' " -> Adding sudo user..."
    useradd -m -g users -G wheel ${user} 
    printf "${user_passwd}\n${user_passwd}\n" | passwd ${user}
    sleep 1

    printf '%s\n' " -> Enabling sudoers..."
    sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
    sleep 1

  #-----[ SHARED RESOURCES ]
  # -- Will copy files to the /usr/local/.

    printf '%s\n' ":: Deploying files..."

    # -- /usr/local/share/.
        # -- bookmarks.db
        ln -s ${git_local}/share/bookmarks.db ${usr_local}/share/bookmarks.db
        printf '%s\n' " -> Symlink created for bookmarks.db"

    # -- /usr/local/bin.
        # -- TODO: ADD SCRIPTS HERE!!!
        # -- bookmarks.py
        ln -s ${git_local}/bin/bookmarks.py ${usr_local}/bin/bookmarks.py
        printf '%s\n' " -> Symlink created to bookmarks.py"
        # -- EGOmenu.sh
        ln -s ${git_local}/bin/EGOmenu.sh ${usr_local}/bin/EGOmenu.sh
        printf '%s\n' " -> Symlink created to EGOmenu.sh"
        # -- hash-id.py
        ln -s ${git_local}/bin/hash-id.py ${usr_local}/bin/hash-id.py
        printf '%s\n' " -> Symlink created to hash-id.py"
        # -- linpeas.sh
        ln -s ${git_local}/bin/linpeas.sh ${usr_local}/bin/linpeash.sh
        printf '%s\n' " -> Symlink created to linpeas.sh"

    # -- /usr/local/share/wordlist/.
        mkdir /usr/local/share/wordlist
        # -- rockyou.txt
        tar -xzf ${git_local}/share/wordlist/rockyou.tar.gz --directory ${usr_local}/share/wordlist/
        printf '%s\n' " -> Copying rockyou.txt to ${usr_local}/share/wordlist/..."
        # -- best1050.txt
        cp ${git_local}/share/wordlist/best1050.txt ${usr_local}/share/wordlist/
        printf '%s\n' " -> Copying best1050.txt to ${usr_local}/share/wordlist/..."
        # -- seclist-big.txt
        cp ${git_local}/share/wordlist/seclist-big.txt ${usr_local}/share/wordlist/
        printf '%s\n' " -> Copying seclist-big.txt to ${usr_local}/share/wordlist/..."
        # -- xplateform.txt
        cp ${git_local}/share/wordlist/xplateform.txt ${usr_local}/share/wordlist/
        printf '%s\n' " -> Copying xplateform.txt to ${usr_local}/share/wordlist/..."

    # -- /usr/local/share/reverse_shell/.
        mkdir /usr/local/share/reverse_shell/.
        # -- Pentest Monkey php reverse shell.
        cp ${git_local}/share/wordlist/php-reverse-shell.php ${usr_local}/share/reverse_shell/
        printf '%s\n' " -> Copying php-reverse-shell.php to ${usr_local}/share/reverse_shell/..."
        
  #-----[ SWAPFILE ]

    printf '%s\n' "${blue}:: Creating the swapfile...${reset}"
    fallocate -l 1G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    echo "/swapfile none swap defaults 0 0" >> /etc/fstab
    sleep 1

  #-----[ FIX PACMAN MIRRORLIST ]

    printf '%s\n' "${blue}:: Fixing Pacman mirrorlist...${reset}"
    # curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/all/
    # curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/?country=CA
    curl -o /etc/pacman.d/mirrorlist "https://archlinux.org/mirrorlist/?country=CA&country=US&protocol=http&protocol=https&ip_version=4"
    sleep 1
    sed -i -e 's/\#Server/Server/g' /etc/pacman.d/mirrorlist
    cat /etc/pacman.d/mirrorlist
    # rankmirrors /etc/pacman.d/mirrorlist
    sleep 1

  #-----[ PACKAGES INSTALL ]

    printf '%s\n' "${blue}:: Installing packages...${reset}"
    pacman -Syu --noconfirm - < ${git_local}/pkg_list.txt
    sleep 1

  #-----[ YAY ]

    printf '%s\n' "${blue}:: Installing YAY...${reset}"
    cd /opt
    git clone https://aur.archlinux.org/yay.git
    chown -R ${user}:users yay
    cd yay
    su ${user} -c "makepkg -si --needed --noconfirm"
    sleep 1

    printf '%s\n' "${blue}:: Installing AUR packages...${reset}"
    sudo -u ${user} /bin/bash -c "yay -S --noconfirm - < ${git_local}/pkg_aur.txt"
    sleep 1

  #-----[ BOOTLOADER ]

    printf '%s\n' "${blue}:: Installing and configuring the bootloader...${reset}"
    grub-install /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg
    sleep 1

  #-----[ VIRTUALBOX VM OPTIONS ]

    systemctl start vboxservice.service 
    systemctl enable vboxservice.service 

EOF

  chmod +x /mnt/root/sysconfig.sh
  arch-chroot /mnt /root/sysconfig.sh 2>&1 | tee /mnt/root/report.txt

  printf '%s\n' "${green}:: Installation completed...${reset}"
  printf '%s\n' "${green}:: SHUTTING DOWN SYSTEM...${reset}"
  umount -R /mnt
  shutdown now

#----------{ NOTES }
  # --- Find Arch Linux iso link (on Canada mirror) and download.
  # iso_link=$(curl --silent https://archlinux.org/download/ | grep -A 10 -i "canada" | grep --max-count 1 -oP "(?<=href\=\").*(?=\")")
  # iso_name=$(curl --silent ${iso_link} | grep -oP "(?<=href\=\")archlinux.*\.iso(?=\")")
  # curl "${iso_link}/${iso_name}" -o ${HOME}/Downloads/${iso_name}

  # --- Getting the script on the machine.
  # ... Using Python and curl
  # ... On the HOST:
  # python -m http.server 8080
  # ... on the VM:
  # curl <IP address of LHOST>:8080/alterego.sh
  # bash alterego.sh

#--{ file:fin }----------------------------------------------------------------
