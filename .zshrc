export PATH="$HOME/bin:$PATH"

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

# Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'