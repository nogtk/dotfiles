SCRIPT_DIR=$HOME/dotfiles

source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/p10k.zsh

# Customize to your needs...
eval "$(direnv hook zsh)"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
alias g='git'
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=78'
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_all_dups
setopt extended_history
setopt share_history
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_expand
setopt inc_append_history

# === cool-peco init ===
FPATH="$FPATH:/Users/taka.naoga/cool-peco"
autoload -Uz cool-peco
cool-peco
# ======================

bindkey '^r' cool-peco-history
alias pco=cool-peco-git-checkout
alias pps=cool-peco-ps
alias plog=cool-peco-git-log

alias t='tig'

alias ls='lsd'
alias ll='lsd -l'

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

export PATH=$PATH:$HOME/jisaku_command
export PATH=$PATH:$HOME/.cargo/bin
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

alias be='bundle exec'
alias chrome="open /Applications/Google\ Chrome.app"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taka.naoga/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taka.naoga/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taka.naoga/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taka.naoga/google-cloud-sdk/completion.zsh.inc'; fi

# for alias ghq and peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src

# For use vim in gh
export GIT_EDITOR=vim

