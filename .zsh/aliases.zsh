#          ╭──────────────────────────────────────────────────────────╮
#          │                         Aliases                          │
#          ╰──────────────────────────────────────────────────────────╯
# alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
# alias grep='grep --color=auto'
alias grep='rg'
# alias sp='sudo pacman'
alias cat='bat'
alias clip='wl-copy'

# ── fzf ───────────────────────────────────────────────────────────────
alias fzf="fzf --preview='cat {}'"
alias nvimf='nvim $(fzf)'

# ── zoxide ────────────────────────────────────────────────────────────
alias ff='cdi'
alias cde='zoxide edit'

# ── Functions ─────────────────────────────────────────────────────────
source ~/.zsh/aliases_functions.zsh
