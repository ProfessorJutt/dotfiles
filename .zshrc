# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jutt"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# fnm
FNM_PATH="/home/jutt/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
alias zconf="nvim ~/.zshrc"
alias src="source ~/.zshrc"
alias l="eza -l --color=always --icons=always --no-time --no-permissions --no-user --no-filesize"
alias ls="eza -l --color=always --icons=always --no-time --no-permissions --no-user --no-filesize"
alias la="eza -l --color=always --icons=always --no-time --no-permissions --no-user -a --no-filesize"
alias lsa="eza -l --color=always --icons=always --no-time --no-permissions --no-user -a --no-filesize"

