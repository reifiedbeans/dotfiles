#####################
# ZSH CONFIGURATION #
#####################

# OH-MY-ZSH SETUP
#####################

# Path for oh-my-zsh installation
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

# Clean up home dir further (interactive only)
ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
HISTFILE="$XDG_CACHE_HOME/zsh/history"
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"
[ -f "$HISTFILE" ] || ( mkdir -p "$XDG_CACHE_HOME/zsh"; touch "$HISTFILE" )

export LESSHISTFILE=-

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# oh-my-zsh plugins
plugins=()

# Start oh-my-zsh
if [[ -d "$ZSH" ]]; then
	source "$ZSH/oh-my-zsh.sh"
else
	echo "Could not find oh-my-zsh at $ZSH. Consider cloning it for the best experience."
fi


# CONFIGURATION
#####################

# Add Homebrew to PATH (Apple Silicon)
if [[ -x '/opt/homebrew/bin/brew' ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Enable vim mode
bindkey -v
export KEYTIMEOUT=1

# Use neovim, if present
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# Add verbose output
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"
alias mkdir="mkdir -pv"

# Setup GPG tty
export GPG_TTY=$TTY

# Default programs
export EDITOR="vim"

# Application aliases
app="/Applications"
if [[ $(uname) == "Darwin" ]]; then
	launch_app() {
		open -na "$1" --args "${@:2}"
	}

	[ -d "$app/IntelliJ IDEA CE.app" ] && alias idea='launch_app "IntelliJ IDEA CE.app"'
	[ -d "$app/IntelliJ IDEA.app" ] && alias idea='launch_app "IntelliJ IDEA.app"'
fi
unset app

# Load local-only .zshrc
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"


# DEV TOOLS
#####################

# Ruby
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"
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


# PROMPT
#####################

# Start Starship prompt (https://github.com/starship/starship)
if command -v starship >/dev/null; then
	eval "$(starship init zsh)"
else
	echo 'starship prompt is not installed. Consider installing it for the best experience.'
fi
