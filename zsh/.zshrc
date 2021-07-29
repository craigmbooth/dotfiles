# All environment variables and the like that I don't want on github
source $HOME/.zshrc.secret

# Default editor
export EDITOR="emacs -nw"

# ZSH and oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ZSH_THEME="kphoen"
plugins=(jsontools pip django jira)
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/home/cbooth/bin:/home/cbooth/.local"
export HISTCONTROL=ignoreboth:erasedups

# Stuff put here by pyenv
export PATH="/home/cbooth/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cbooth/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cbooth/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cbooth/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cbooth/google-cloud-sdk/completion.zsh.inc'; fi

# Custom aliases
alias en="emacs -nw"
alias gbc="git log --format='%s  %h  %ae' $(git tag -l '1.*.0' | tail -n 1)..HEAD | grep -v -E '^(Merge|Revert)' | grep -v -E '^(DEV|SRE|DATA)-[0-9]+'"
alias gprune=" git fetch --prune; git branch --merged | grep -v '*' | xargs git branch -d"
