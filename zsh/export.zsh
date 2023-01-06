# go
export GOENV_ROOT="$HOME/.goenv"
export GOENV_DISABLE_GOPATH=1
export GOPATH="$HOME/go"

# java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# openssl
## x86_64
# export LDFLAGS="-L/usr/local/opt/openssl/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl/include"

## arm
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl/include"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# path
export PATH="/usr/local/opt/openssl/bin:$HOME/jisaku_command:$HOME/.cargo/bin:$GOENV_ROOT/bin:$GOPATH/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/X11/bin:$PATH
export PATH=/Applications/CMake.app/Contents/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# For use vim in gh
export GIT_EDITOR=vim

export DISPLAY=:0.0

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# enable multi process on mac
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# python
export PATH="$(brew --prefix python3)/bin:$PATH"

# bundler
BUNDLER_EDITOR="$(which /usr/local/bin/code)"

# ghq
export GHQ_ROOT="${HOME}/Development"
