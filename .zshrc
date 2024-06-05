# ==============================================
# Lines configured by zsh-newuser-install
# ==============================================
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ovsiankina/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# ==============================================
# ENV VARIABLES
# ==============================================

# Keymap layout
# setxkbmap us_qwerty-fr
export XKB_DEFAULT_LAYOUT=us_qwerty-fr
# Java
export JAVA_HOME=/usr/lib/jvm/java-22-openjdk
export _JAVA_AWT_WM_NONREPARENTING=1
# Tmux
export PATH="$HOME/.tmuxifier/bin:$PATH"

# ==============================================
# zsh configuration / plugins
# ==============================================

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==============================================
# Alias
# ==============================================

source ~/aliases.zsh

eval "$(tmuxifier init -)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

neofetch
