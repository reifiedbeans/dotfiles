#####################
# ZSH CONFIGURATION #
#####################

# HOME DIR CLEANUP
#####################

# cdk
export CDK_HOME="$XDG_DATA_HOME/cdk"

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

# pnpm
export PNPM_HOME="/Users/drew/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc"

# ruby
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# zsh
ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump"
HISTFILE="$ZSH_CACHE_DIR/history"
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"
[ -d "$HISTFILE" ] || touch "$HISTFILE"


# CONFIGURATION
#####################

# Add Homebrew to PATH (Apple Silicon)
if [[ -x '/opt/homebrew/bin/brew' ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add completions from Homebrew packages
if [[ "$(uname)" == 'Darwin' ]]; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

# Use neovim, if present
command -v 'nvim' > '/dev/null' && alias vim='nvim' vimdiff='nvim -d'

# Add verbose output
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkdir='mkdir -pv'

# Default programs
export EDITOR='vim'

# Application aliases
if [[ "$(uname)" == 'Darwin' ]]; then
	launch-app() {
		open -na "$1" --args "${@:2}"
	}

	[ -d '/Applications/IntelliJ IDEA CE.app' ] && alias idea='launch-app "IntelliJ IDEA CE.app"'
	[ -d '/Applications/IntelliJ IDEA.app' ] && alias idea='launch-app "IntelliJ IDEA.app"'
fi

# Load rtx
command -v 'rtx' > '/dev/null' && eval "$(rtx activate zsh)"

# Load local-only .zshrc
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"


# OH-MY-ZSH
#####################

# Path for oh-my-zsh installation
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# oh-my-zsh plugins
plugins=('vi-mode')

# Start oh-my-zsh
if [[ -d "$ZSH" ]]; then
	source "$ZSH/oh-my-zsh.sh"
else
	echo "Could not find oh-my-zsh at $ZSH. Consider cloning it for the best experience."
fi


# PROMPT
#####################

# Start Starship prompt (https://github.com/starship/starship)
if command -v 'starship' > '/dev/null'; then
	eval "$(starship init zsh)"
else
	echo 'starship prompt is not installed. Consider installing it for the best experience.'
fi
