# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(
  colored-man-pages
  docker
  docker-compose
  git
  sudo
  tmux
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