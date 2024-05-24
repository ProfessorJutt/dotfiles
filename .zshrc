 ZSH_THEME="agnoster"

plugins=(git)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

prompt_context() {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USERNAME"
  fi
}
