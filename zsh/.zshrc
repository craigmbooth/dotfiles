source $HOME/.zshrc.secret

# Path to your oh-my-zsh installation.
export ZSH=/Users/cbooth/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/cbooth/bin"
source $ZSH/oh-my-zsh.sh

export HISTCONTROL=ignoreboth:erasedups

alias en="emacs -nw

