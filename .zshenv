#####################
#  ZSH ENVIRONMENT  #
#####################

# HOME DIR SETUP
#####################

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
[ -d "$XDG_CACHE_HOME" ] || mkdir -p "$XDG_CACHE_HOME"
[ -d "$XDG_CONFIG_HOME" ] || mkdir -p "$XDG_CONFIG_HOME"
[ -d "$XDG_DATA_HOME" ] || mkdir -p "$XDG_DATA_HOME"
[ -d "$XDG_STATE_HOME" ] || mkdir -p "$XDG_STATE_HOME"

# aws
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"

# cdk
export CDK_HOME="$XDG_DATA_HOME/cdk"

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# go
export GOPATH="$XDG_DATA_HOME/go"

# gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# less
export LESSHISTFILE=-

# node
export NODE_REPL_HISTORY=''
export TS_NODE_HISTORY='/dev/null'

# npm
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_LOGS_DIR="$XDG_STATE_HOME/npm/logs"

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc"

# ruby
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# yadm
export YADM_DIR="$XDG_CONFIG_HOME/yadm"
export YADM_DATA="$XDG_DATA_HOME/yadm"
[ -d "$YADM_DIR" ] || mkdir -p "$YADM_DIR"
[ -d "$YADM_DATA" ] || mkdir -p "$YADM_DATA"

# Disable .zsh_sessions in macOS
SHELL_SESSIONS_DISABLE=1


# PATH CONFIGURATION
#####################

# Add Homebrew to PATH (Apple Silicon)
if [[ -x '/opt/homebrew/bin/brew' ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Load mise
command -v 'mise' > '/dev/null' && eval "$(mise activate zsh)"

# Load local-only .zshenv
[[ -f "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
