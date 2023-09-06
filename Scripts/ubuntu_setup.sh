#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -o pipefail # Propagate exit code on a pipeline
set -x # Print commands and their arguments as they are executed.

function main() {
    install-common-software-apt
    install-common-software-snap
    # Add flathub
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    install-common-software-flatpak

    # TODO: Install non repository managed applications (1Password, NAPS2)
    install-virtualbox

    # Remove the Snap store, Gnome Software is installed instead
    sudo snap remove --purge snap-store
}

function install-common-software-apt() {
    local software

    software=(
        curl
        flatpak
        git
        gnome-software
        gnome-software-plugin-flatpak
        gnome-software-plugin-snap
        gnome-sushi # Preview files from Nautilus
        gnome-tweaks
        hunspell-es # Spanish dictionary
        shellcheck
        vim
        wl-clipboard # Copy&paste in the terminal
    )
    readonly software

    sudo apt update
    sudo apt install --assume-yes "${software[@]}"
}

function install-common-software-snap() {
    sudo snap install code --classic
    snap install spotify
}

function install-common-software-flatpak() {
    local software

    software=(
        com.github.tchx84.Flatseal
        io.missioncenter.MissionCenter
        org.gimp.GIMP
        org.gnome.Cheese
        org.gnome.Evince
        org.libreoffice.LibreOffice
    )
    readonly software

    # Install system wide with sudo, this is because I don't want to use home
    # directory storage on flatpak applications
    sudo flatpak install --system --assumeyes "${software[@]}"
}

function install-virtualbox() {
    setup-virtualbox-repository

    sudo apt install virtualbox-7.0

    # Ensure the user is part of VirtualBox group
    sudo usermod -a -G vboxusers "$USER"
}

function setup-virtualbox-repository() {
    local oracle_public_key_download_path oracle_public_key_path

    oracle_public_key_download_path="$(mktemp)"
    readonly oracle_public_key_download_path

    oracle_public_key_path=/usr/share/keyrings/oracle_vbox_2016.gpg
    readonly oracle_public_key_path

    # Fetch GPG key
    curl --output "$oracle_public_key_download_path" https://www.virtualbox.org/download/oracle_vbox_2016.asc
    gpg --dearmor "$oracle_public_key_download_path"
    sudo mv "$oracle_public_key_download_path".gpg "$oracle_public_key_path"

    # Create repository file
    echo "deb [arch=amd64 signed-by=$oracle_public_key_path] https://download.virtualbox.org/virtualbox/debian $(lsb_release --codename --short) contrib" \
        | sudo tee /etc/apt/sources.list.d/virtualbox.list

    # Fetch repository metadata only for VirtualBox
    sudo apt update \
        -o Dir::Etc::sourcelist=sources.list.d/virtualbox.list \
        -o Dir::Etc::sourceparts=- \
        -o APT::Get::List-Cleanup=0 
}

main "$@"
