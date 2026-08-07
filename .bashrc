export PATH="$HOME/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# History
HISTSIZE=5000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Add aliases
. ~/.aliases

# Prompt Setup
__git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
    branch=$(git rev-parse --short HEAD 2>/dev/null) || return
    printf ' (%s)' "$branch"
}

__build_prompt() {
    local exit_code=$?

    local green=$'\001\e[38;2;166;227;161m\002'
    local red=$'\001\e[38;2;243;139;168m\002'
    local lavender=$'\001\e[38;2;180;190;254m\002'
    local surface2=$'\001\e[38;2;88;91;112m\002'
    local reset=$'\001\e[0m\002'

    local status_seg
    if [ $exit_code -eq 0 ]; then
        status_seg="${green}●"
    else
        status_seg="${red}● ${exit_code}"
    fi

    PS1="${status_seg} ${lavender}\w${surface2}$(__git_branch)${reset} \$ "
}

PROMPT_COMMAND=__build_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable zoxide
#eval "$(zoxide init bash --cmd cd)"