HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY          # Adiciona ao histórico em vez de sobrescrever
setopt HIST_IGNORE_DUPS        # Não grava comandos repetidos em sequência
setopt HIST_FIND_NO_DUPS       # Não exibe duplicatas ao buscar no histórico
setopt SHARE_HISTORY           # Compartilha histórico entre terminais abertos instantaneamente

# --- 2. Autocompletar (O maior poder do Zsh) ---
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # Ignora maiúsculas/minúsculas (cd doc -> Documents)
zstyle ':completion:*' menu select                      # Cria um menu selecionável com as setas ao apertar TAB
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Usa as cores do 'ls' no menu de completamento

# --- 3. Navegação e Usabilidade ---
setopt AUTO_CD                 # Se digitar apenas o nome da pasta, ele entra nela (sem precisar digitar 'cd')
setopt CORRECT                 # Sugere correção se você digitar um comando errado (ex: sl -> ls)

# --- 4. Prompt Funcional (Simples e Colorido para leitura) ---
# Formato: usuario@host:pasta atual $
autoload -U colors && colors

# # --- Configuração Git (vcs_info) ---
# autoload -Uz vcs_info
# precmd() { vcs_info } # Executa antes de desenhar cada prompt

# Formato da mensagem: (branch) em magenta
# zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%f '
# zstyle ':vcs_info:*' enable git # Habilita apenas git (ignora svn, hg, etc para ser rápido)

# --- Prompt ---
setopt PROMPT_SUBST # Permite que funções rodem dentro do prompt

# O prompt agora inclui a variável ${vcs_info_msg_0_}
# PROMPT='%F{green}%n%f@%F{yellow}%m%f:%F{blue}%~%f ${vcs_info_msg_0_}$ '
PROMPT='%F{white}%n%f@%F{green}%m%f:%F{blue}%~%f $ '

bindkey -e

# --- 5. Aliases Úteis (Opcional, mas recomendado) ---
alias ls='ls --color=auto'
alias ll='ls -larth --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'

export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/opt/idea-IU-252.27397.103/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PAGER=less

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

# TMUX INIT
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    # Tenta conectar a qualquer sessão existente (silenciando erros)
    # Se falhar (||), cria uma nova
    tmux attach || tmux new
fi

# dotnet 
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
