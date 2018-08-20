#!/bin/bash
#
# Based on https://wiki.archlinux.org/index.php/Installation_guide
#

readonly ROOT_PARTITION=/dev/sda1

function basicSetup {
    loadkeys us
    timedatectl set-ntp true
}

function diskSetup {
    # Creates two partitions, a root partition of 15.5G
    # and a swap partition with the rest
    fdisk /dev/sda<<STOP
n
p
1

+15.5G
n
p
2


w
STOP
    mkfs.ext4 $ROOT_PARTITION
    mkswap /dev/sda2
    swapon /dev/sda2
}

function baseSystemSetup {
    mount $ROOT_PARTITION /mnt
    pacstrap /mnt base
    genfstab -U /mnt >> /mnt/etc/fstab
}

basicSetup
diskSetup
baseSystemSetup

echo "Remember to do arch-chroot /mnt"

