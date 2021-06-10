# Add Homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Clean up home directory (dev tools)
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export GOPATH="$XDG_DATA_HOME/go"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"


# Set up rbenv if installed
if command -v rbenv >/dev/null; then
	export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
	[ -d "$RBENV_ROOT" ] || mkdir -p "$RBENV_ROOT"
	command -v rbenv >/dev/null && eval "$(rbenv init -)"
else
	export GEM_HOME="$XDG_DATA_HOME/gem"
fi


# Set PYTHONSTARTUP
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc"
