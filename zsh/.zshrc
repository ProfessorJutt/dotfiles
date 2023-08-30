# ZSH_THEME="simple"
# ZSH_THEME="wezm+"
 ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_profile

prompt_context() {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USERNAME"
  fi
}
