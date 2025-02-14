# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
SCRIPT_DIR=$HOME/dotfiles

source $SCRIPT_DIR/zsh/config.zsh
source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/p10k.zsh
source $SCRIPT_DIR/zsh/alias.zsh
source $SCRIPT_DIR/zsh/export.zsh
source $SCRIPT_DIR/zsh/export_secret.zsh

# === cool-peco init ===
# FPATH="$FPATH:$HOME/cool-peco"
# autoload -Uz cool-peco
# cool-peco
# ======================

# bind key for cool-peco
bindkey '^r' cool-peco-history
bindkey '^G' cool-peco-ghq

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taka.naoga/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taka.naoga/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taka.naoga/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taka.naoga/google-cloud-sdk/completion.zsh.inc'; fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship
eval "$(starship init zsh)"

# asdf
if [ "`brew list | grep chromedriver`" ]; then
  brew install chromedriver
fi
. $(brew --prefix asdf)/libexec/asdf.sh

