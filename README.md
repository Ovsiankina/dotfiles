# Doc

The path used:

`$PATH = ~/.config/Dotfiles/`

## Requirements

### Main

#### pacman packages
- git
- stow
- neovim
- zsh
- zoxide
- gcc
- bat
- tmux
- which
- starship
- fzf
- thefuck
- neofetch
- eza
- zip
- unzip
- texlive

#### git clone
- fzf-git
- tmuxifier
- tpm

#### install tmux plugins
1. open tmux
2. `<leader> + I` (capitalized) to install all plugins listed in .tmux.conf

### Optional pacman packages
- Hyprland
- Waybar

## Installation

### Arch WSL
If using Arch WSL (https://github.com/yuk7/ArchWSL):
Follow this guide: (https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/#initialize-keyring)

#### Set up default user (optional)

```
>Arch.exe
[root@PC-NAME]# echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
(setup sudoers file.)

[root@PC-NAME]# useradd -m -G wheel -s /bin/bash {username}
(add user)

[root@PC-NAME]# passwd {username}
(set default user password)

[root@PC-NAME]# exit

>Arch.exe config --default-user {username}
    (setting to default user)


```
#### Initiallize keyring
```
>Arch.exe
[user@PC-NAME]$ sudo pacman-key --init

[user@PC-NAME]$ sudo pacman-key --populate

[user@PC-NAME]$ sudo pacman -Sy archlinux-keyring

[user@PC-NAME]$ sudo pacman -Su

```

### With or without arch wsl
```
$ sudo pacman -Syu git
$ git clone https://github.com/Ovsiankina/dotfiles.git
$ sudo pacman -S stow neovim zsh zoxide gcc bat tmux which

$ su USERNAME
$ chsh -s $(which zsh)

#if does not work
#cat /etc/shells and take the paath for zsh then retry with manually inserting the path

```
Restart terminal

```
$ cd /home/USERNAME/dofiles
$ cd stow .

$ git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
$ sudo pacman -S starship fzf thefuck neofetch

$ source ~/dotfiles/.zshrc

```
## Source

https://www.youtube.com/watch?v=y6XCebnB9gs
