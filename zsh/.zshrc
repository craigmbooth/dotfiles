# All environment variables and the like that I don't want on github
source $HOME/.zshrc.secret

# Default editor
export EDITOR="nano"

# ZSH and oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ZSH_THEME="kphoen"
plugins=(jsontools pip jira)
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/home/cbooth/bin:/home/cbooth/.local:/snap/bin/"
export HISTCONTROL=ignoreboth:erasedups

# Stuff put here by pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Custom aliases
alias gbc="git log --format='%s  %h  %ae' $(git tag -l '1.*.0' | tail -n 1)..HEAD | grep -v -E '^(Merge|Revert)' | grep -v -E '^(DEV|SRE|DATA)-[0-9]+'"
alias gprune="git fetch --prune; git branch --merged | grep -v '*' | xargs git branch -d"
alias fixaudio="pulseaudio -k && sudo alsa force-reload"
alias fixscreen="$HOME/bin/attach_screen eDP-1 HDMI-2"
alias speakerid="pacmd list-sinks | grep index | sed 's/[^0-9]*//g'"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/craig/pb/questions/backend/analytics-api/google-cloud-sdk/path.zsh.inc' ]; then . '/home/craig/pb/questions/backend/analytics-api/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/craig/pb/questions/backend/analytics-api/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/craig/pb/questions/backend/analytics-api/google-cloud-sdk/completion.zsh.inc'; fi
