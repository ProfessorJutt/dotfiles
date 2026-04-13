# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt autocd beep extendedglob

# User Binary Directory
export BIN_DIR="$HOME/.local/bin"
export PATH="$BIN_DIR:$PATH"

# Vimmy
bindkey -v
# bindkey '^R' history-incremental-search-backward

# Setup Starship / Funky sourcing fix..
type starship_zle-keymap-select >/dev/null || \
{
  eval "$(starship init zsh)"
}

# Setup Fzf
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target,.steam,Games
  --preview 'tree -C {}'"

source <(fzf --zsh)

# SSH - Arch
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# FZF Nav Jazz
op() {
  local base="${1:-$HOME/projects}"
  local dir

  [[ "$base" == "~"* ]] && base="${base/\-/$HOME}"

  dir="$(
    find "$base" -mindepth 1 -maxdepth 1 -type d \
      2>/dev/null \
    | sed "s|^$base/||" \
    | fzf --height 40% --layout reverse --prompt='Where yah goin? -> '
  )" || return
  
  [[ -n "$dir" ]] && cd -- "$base/$dir"
}

alias o='op "$PWD"'

# Aliastown
alias zconf="nvim $HOME/.zshrc"
alias src="source $HOME/.zshrc"
