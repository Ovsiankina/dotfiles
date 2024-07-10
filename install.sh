#!/bin/bash
# git clone https://github.com/Ovsiankina/dotfiles.git

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

# Ask user for an username
echo "What username would you like to use ?: "
read USERNAME

useradd -m -G wheel -s /bin/bash $USERNAME
passwd $USERNAME
su $USERNAME

sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Sy archlinux-keyring
sudo pacman -Su

sudo pacman -Syu git tow neovim zsh zoxide gcc bat tmux which starship fzf thefuck neofetch

git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier

chsh -s $(which zsh)

# if does not work
# cat /etc/shells and take the paath for zsh then retry with manually inserting the path

cd ~/dotfiles
cd stow .

source ~/dotfiles/.zshrc

echo "Please enter tmux and use '<TMUX-leader> + I' to install tmux plugins"
