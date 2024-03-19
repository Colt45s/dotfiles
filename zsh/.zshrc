typeset -U path PATH

# aqua
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
export AQUA_GLOBAL_CONFIG=${AQUA_GLOBAL_CONFIG:-}:${XDG_CONFIG_HOME:-$HOME/.config}/aqua/aqua.yaml

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Go
export PATH="$(go env GOPATH)/bin:$PATH"

export EDITOR="nvim"

alias history='history -t "%F %T"'
alias cat='bat'
alias ls='eza'
alias r='cd $(ghq root)/$(ghq list | peco)'
alias cd='z'
alias zshrc='nvim ~/.config/zsh/.zshrc'
alias d='docker'
alias dex='docker exec -it'
alias dc='docker-compose'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias c='clear'
alias x='exit'
alias gui='gitui'
alias mtar='tar -zcvf'
alias utar='tar -zxvf'
alias zi='zip -r'
alias uzi='unzip'
alias mkdir='mkdir -p'
alias rm='rm -rf'
alias python='python3'
alias lg='lazygit'

# history
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history
setopt share_history
setopt extended_history
setopt append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

# glob
setopt glob
setopt extended_glob
setopt nomatch
setopt glob_dots
setopt brace_ccl

setopt correct
setopt aliases
setopt mark_dirs

if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

eval "$(zoxide init zsh)"
eval "$(rbenv init - zsh)"
eval "$(nodenv init -)"
eval "$(sheldon source)"
eval "$(starship init zsh)"

killport() {
  lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9
}
