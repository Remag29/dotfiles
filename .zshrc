# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Vim as default
export VISUAL=vim
export EDITOR="$VISUAL"

# Language variable
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Plugins
plugins=(
  colored-man-pages
  docker
  docker-compose
  git
  sudo
  tmux
  you-should-use
  z
  zsh-autosuggestions
  zsh-bat
  zsh-syntax-highlighting
)

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/tristan/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# OhMyZSH script
source $ZSH/oh-my-zsh.sh

# StarShip
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
