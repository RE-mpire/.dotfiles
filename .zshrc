export PATH="$HOME/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# Setup Homebrew (MacOS)
# eval "$(/opt/homebrew/bin/brew shellenv)"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^d' kill-word
bindkey '^D' backward-kill-word

# Add aliases
. ~/.aliases

# zoxide and fzf integration
# source <(fzf --zsh)
# eval "$(zoxide init zsh --cmd cd)"


# Prompt Setup
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{#585b70}(%b)%r%f'

precmd_functions+=(vcs_info)

_build_prompt() {
  local -A ctp_mocha=(
    green  '#a6e3a1'
    red    '#f38ba8'
    lavender '#b4befe'
    surface2 '#585b70'
    blue  '#89b4fa'
  )
  local exit_ok="%F{${ctp_mocha[green]}}●"
  local exit_err="%F{${ctp_mocha[red]}}● %?"

  local host_segment=""
  if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
    host_segment="%F{${ctp_mocha[blue]}}%m%f "
  fi

  PROMPT='%(?.'"$exit_ok"'.'"$exit_err"') '"$host_segment"'%F{'"${ctp_mocha[lavender]}"'}%~%f %# '
  RPROMPT='${vcs_info_msg_0_}'
}
_build_prompt

# Completions (skip compaudit security check unless dump is >24h old)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  # -C skips compaudit
  compinit -C
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'