# FZF Configuration

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80% --border=sharp"
export FZF_COMPLETION_PATH_OPTS="--walker file,dir,follow,hidden --preview='bat --color=always {}'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"