export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000

setopt hist_ignore_all_dups
setopt extended_history
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_expand

# share .zshhistroy
setopt inc_append_history
setopt share_history

# automatically change directory when dir name is typed
setopt auto_cd

# disable ctrl+s, ctrl+q
setopt no_flow_control
