if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

# All environment variables and the like that I don't want on github
source $HOME/.zshrc.secret

# Default editor
export EDITOR="emacs -nw"

# ZSH and oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ZSH_THEME="kphoen"
plugins=(jsontools pip)
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/cbooth/bin"
export HISTCONTROL=ignoreboth:erasedups

alias en="emacs -nw"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

# pyenv setup
export PATH="/home/cbooth/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
