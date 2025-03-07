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

# Aliastown
alias zconf="nvim $HOME/.zshrc"
alias src="source $HOME/.zshrc"

alias l="eza -l --octal-permissions --color=always --icons=always --no-time --no-permissions --no-user --no-filesize --git"
alias ls="eza -l --octal-permissions --color=always --icons=always --no-time --no-permissions --no-user --no-filesize"
alias la="eza -l --octal-permissions --color=always --icons=always --no-time --no-permissions --no-user -a --no-filesize"
alias lsa="eza -l --octal-permissions --color=always --icons=always -a --no-permissions"
