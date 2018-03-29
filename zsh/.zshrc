source $HOME/.zshrc.secret

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="alanpeabody"

plugins=(jsontools pip)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/cbooth/bin"
source $ZSH/oh-my-zsh.sh

export HISTCONTROL=ignoreboth:erasedups

alias en="emacs -nw"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi
