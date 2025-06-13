# Doc

- [Doc](#doc)
  - [Requirements](#requirements)
    - [Main](#main)
      - [Pacman packages](#pacman-packages)
        - [Optional](#optional)
      - [git clone](#git-clone)
      - [NPM packages](#npm-packages)
      - [install tmux plugins](#install-tmux-plugins)
    - [Optional pacman packages](#optional-pacman-packages)
  - [Installation](#installation)
    - [Arch WSL](#arch-wsl)
      - [Set up default user (optional)](#set-up-default-user-optional)
      - [Initiallize keyring](#initiallize-keyring)
    - [With or without arch wsl](#with-or-without-arch-wsl)
  - [Sources](#sources)

 path used:

`$PATH = ~/.config/Dotfiles/`

## TODO

- [ ] Style kitty to have no bg color, just transparency
- [ ] white / tranparent / liquidy style
- [ ] frosted transaprency everywhere similar to contest #1 Winder december 2022 winner [github](https://hyprland.org/hall_of_fame/)
- [ ] cutomize walker (rofi replacment)
## Requirements

### Main

#### Pacman packages
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
- texlive (npm install -g tree-sitter-cli)
- openssh
- wl-clipboard
##### Optional
- xorg-server (For python x11 within wsl)

#### git clone
- fzf-git
- tmuxifier
- tpm

#### NPM packages
- npm i -g pyright

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

```bash
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
```bash
>Arch.exe
[user@PC-NAME]$ sudo pacman-key --init

[user@PC-NAME]$ sudo pacman-key --populate

[user@PC-NAME]$ sudo pacman -Sy archlinux-keyring

[user@PC-NAME]$ sudo pacman -Su

```

### With or without arch wsl
```bash
$ sudo pacman -Syu git
$ git clone https://github.com/Ovsiankina/dotfiles.git
$ sudo pacman -S stow neovim zsh zoxide gcc bat tmux which

$ su USERNAME
$ chsh -s $(which zsh)

#if does not work
#cat /etc/shells and take the paath for zsh then retry with manually inserting the path

```
Restart terminal

```bash
$ cd /home/USERNAME/dofiles
$ cd stow .

$ git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
$ sudo pacman -S starship fzf thefuck neofetch

$ source ~/dotfiles/.zshrc

```
## Reminder on how to remove a package
```
sudo pacman -Rns <pkg>
sudo pacman -Sc 
hash -r
sudo rm -r /var/log/pacman.log
sudo pacman -Rns $(sudo pacman -Qdtq)
```

## Sources

https://www.youtube.com/watch?v=y6XCebnB9gs
