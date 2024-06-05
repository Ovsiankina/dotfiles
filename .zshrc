# ZINIT zsh plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ==============================================
# zinit plugins / configuration
# ==============================================

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# config
bindkey -e

# TODO: Remove these from system:
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==============================================
# Lines configured by zsh-newuser-install
# ==============================================
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
unsetopt autocd beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ovsiankina/.zshrc'
autoload -Uz compinit && compinit
# End of lines added by compinstall

# ==============================================
# ENV VARIABLES
# ==============================================

# locale
export LANG=fr_CH.UTF-8
export LC_CTYPE=fr_CH.UTF-8
export LANGUAGE=fr_CH.UTF-8
export LC_ALL=fr_CH.UTF-8

# Keymap layout
# setxkbmap us_qwerty-fr
export XKB_DEFAULT_LAYOUT=us_qwerty-fr
# Java
export JAVA_HOME=/usr/lib/jvm/java-22-openjdk
export _JAVA_AWT_WM_NONREPARENTING=1
# Tmux
export PATH="$HOME/.tmuxifier/bin:$PATH"

# ==============================================
# Alias
# ==============================================

source ~/aliases.zsh

eval "$(tmuxifier init -)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

neofetch
