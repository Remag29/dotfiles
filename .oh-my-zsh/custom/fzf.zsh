# FZF Configuration

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--tmux center,80%,50% --layout reverse --inline-info --height 80% --border sharp --style full --preview 'fzf-preview.sh {}'"
export FZF_COMPLETION_PATH_OPTS="--walker file,dir,follow,hidden --preview='bat --color=always {}'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
