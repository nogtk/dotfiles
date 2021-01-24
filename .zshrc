SCRIPT_DIR=$HOME/dotfiles

source $SCRIPT_DIR/zsh/config.zsh
source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/p10k.zsh
source $SCRIPT_DIR/zsh/alias.zsh
source $SCRIPT_DIR/zsh/export.zsh

# anyenv
eval "$(anyenv init -)"

# direnv
eval "$(direnv hook zsh)"
# goenv
eval "$(goenv init -)"

# === cool-peco init ===
FPATH="$FPATH:/Users/taka.naoga/cool-peco"
autoload -Uz cool-peco
cool-peco
# ======================

# bind key for cool-peco
bindkey '^r' cool-peco-history
bindkey '^v' cool-peco-ghq

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taka.naoga/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taka.naoga/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taka.naoga/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taka.naoga/google-cloud-sdk/completion.zsh.inc'; fi

