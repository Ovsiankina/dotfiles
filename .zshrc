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
zinit light Aloxaf/fzf-tab

# Snippets (Oh My ZSH plugins without OMZP framework)
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux

autoload -Uz compinit && compinit
zinit cdreplay -q

# config
bindkey -e
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# TODO: Remove these from system:
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=~/.zsh/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory 
setopt sharehistory
setopt hist_ignore_space # prevent command hist when a space is put before it
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

unsetopt autocd beep

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ==============================================
# ENV VARIABLES
# ==============================================

# locale
export LANG=us_CH.UTF-8
export LC_CTYPE=us_CH.UTF-8
export LANGUAGE=us_CH.UTF-8
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
# Sources
# ==============================================

source ~/.zsh/aliases.zsh
source ~/.zsh/fzf-git.sh/fzf-git.sh

# ==============================================
# Eval
# ==============================================

eval "$(tmuxifier init -)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
eval "$(thefuck --alias fuck)"

# Bonus hihi
neofetch

eval $(thefuck --alias)
