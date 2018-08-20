#!/bin/bash

readonly NEW_TZ=
readonly NEW_LANG=
readonly NEW_KEYMAP=
readonly NEW_HOSTNAME=
readonly NEW_USERNAME=

function setupTimeZone {
    ln -sf /usr/share/zoneinfo/$NEW_TZ /etc/localtime
    hwclock --systohc
}

function setupLocale {
    locale-gen
    echo "LANG=$NEW_LANG" > /etc/locale.conf
    echo "KEYMAP=$NEW_KEYMAP" > /etc/vconsole.conf
}

function setupNetwork {
    echo  > /etc/hostname
    cat<<STOP >> /etc/hosts
127.0.0.1    localhost
::1          localhost
127.0.1.1    $NEW_HOSTNAME.localdomain    $NEW_HOSTNAME
STOP
    systemctl enable dhcpd.service
}

function setupBootloader {
    mkinitcpio -p linux
    pacman -Syu grub
    grub-install --target=i386-pc /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg
}

function setupSystem {
    pacman -Syu vim sudo xorg-server lightdm lightdm-gtk-greeter xfce4 firefox xfce4-whiskermenu-plugin atom git adobe-source-code-pro-fonts
    systemctl enable lightdm.service
}

function setupUser {
    useradd -m -G wheel -s /bin/bash $NEW_USERNAME
}

echo "Remember to edit /etc/locale.gen"
read -rsn1
setupTimeZone
setupLocale
setupNetwork
setupBootloader
setupSystem
echo "Remember to \"passwd root\", \"passwd $NEW_USERNAME\" and \"visudo\""
