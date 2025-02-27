# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Vim as default
export VISUAL=vim
export EDITOR="$VISUAL"

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

# OhMyZSH script
source $ZSH/oh-my-zsh.sh

# StarShip
eval "$(starship init zsh)"
