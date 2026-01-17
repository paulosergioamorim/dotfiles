export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000
export PROMPT="%F{white}%n%f@%F{green}%m%f:%F{blue}%~%f $ "
export EDITOR=nvim
export PAGER=less

bindkey -e # emacs keybind

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

autoload -Uz compinit && compinit
autoload -U colors && colors

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}" 
zstyle ":completion:*" menu select 
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

setopt AUTO_CD 
setopt CORRECT

alias ls="ls --color=auto"
alias ll="ls -larth --color=auto"
alias grep="grep --color=auto"
alias q="exit"
alias reload="source ~/.zshrc"

export PATH=$HOME/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # this loads nvm

# pnpm
export PNPM_HOME="/home/paulosergio/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/paulosergio/.bun/_bun" ] && source "/home/paulosergio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# dotnet 
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH="$PATH:/home/paulosergio/.dotnet/tools"

# fzf setup
source <(fzf --zsh)

# zoxide setup
eval "$(zoxide init zsh)"
