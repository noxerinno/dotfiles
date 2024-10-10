# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#if [[ -f "/opt/homebrew/bin/brew" ]] then
#  # If you're using macOS, you'll want this enabled
#  eval "$(/opt/homebrew/bin/brew shellenv)"
#fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# History
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[w' kill-region

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
# Fzf
[ -f ${HOME}/.fzf.zsh ] && source ${HOME}/.fzf.zsh
eval "$(fzf --zsh)"
# Zoxide
export PATH=$PATH:/home/frantz/.local/bin
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias vim="nvim"
alias c="clear"
alias ls="eza --color=always --long --icons=always --no-permissions --no-filesize --no-user --no-time"
alias ll="eza --color=always --long --icons=always --all"
alias lll="ls -lash --color=auto"
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
alias nvim='/usr/local/bin/nvim.appimage'
alias python="python3"

# Node Version Manager (NVM) 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Support Java
export JAVA_HOME="/usr/lib/jvm/jdk-22.0.2-oracle-x64"
export PATH=$JAVA_HOME/bin:$PATH
# Support Maven
export MAVEN_HOME="/usr/lib/apache-maven-3.9.9/"
export PATH=$MAVEN_HOME/bin:$PATH

# Support Golang
export PATH=$PATH:/usr/local/go/bin
