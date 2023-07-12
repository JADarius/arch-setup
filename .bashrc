#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ll='ls -la'
alias df='df -h'
alias codehere='code . && exit'
PS1='[\u@\h \W]\$ '

# . "$HOME/.cargo/env"
export SUDO_EDITOR=nvim
# export PATH=/home/jadarius/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/jadarius/.local/bin:/home/jadarius/.local/bin

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export RANGER_LOAD_DEFAULT_RC=false
