#####################
#  ZSH ENVIRONMENT  #
#####################

# $PATH LOCATIONS
#####################

# Homebrew (Apple Silicon)
if [[ $(uname) == "Darwin" && $(uname -m) == "arm64" ]]; then
	export PATH="/opt/homebrew/bin:$PATH"
fi


# $HOME CLEANUP
#####################

# Base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
[ -d "$XDG_DATA_HOME" ] || mkdir -p "$XDG_DATA_HOME"
[ -d "$XDG_CACHE_HOME" ] || mkdir -p "$XDG_CACHE_HOME"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Disable .zsh_sessions in macOS
SHELL_SESSIONS_DISABLE=1


# DEV TOOLS
#####################

# Ruby
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
if command -v rbenv >/dev/null; then
	export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
	[ -d "$RBENV_ROOT" ] || mkdir -p "$RBENV_ROOT"
	command -v rbenv >/dev/null && eval "$(rbenv init -)"
else
	export GEM_HOME="$XDG_DATA_HOME/gem"
fi

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc"

# Go
export GOPATH="$XDG_DATA_HOME/go"

# Node.js
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
