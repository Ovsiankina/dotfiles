#!/bin/bash

# Do not copy from windows as the script will have hidden \R char
# That'll prevent the script to run proprely

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

# Ask user for an username
echo "What username would you like to use ?: "
read USERNAME

useradd -m -G wheel -s /bin/bash $USERNAME
passwd $USERNAME

sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Sy archlinux-keyring
sudo pacman -Su
echo "User switched to $USERNAME, please run the commands listed in the README.md"
su $USERNAME
