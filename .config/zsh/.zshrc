#####################
# ZSH CONFIGURATION #
#####################

# OH-MY-ZSH SETUP
#####################

# Path for oh-my-zsh installation
export ZSH=$XDG_CONFIG_HOME/oh-my-zsh

# Clean up home dir further (interactive only)
ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"

ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
HISTFILE="$XDG_CACHE_HOME/zsh/history"
[ -f "$HISTFILE" ] || ( mkdir -p "$XDG_CACHE_HOME/zsh"; touch "$HISTFILE" )

LESSHISTFILE=-

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# oh-my-zsh plugins
plugins=()

# Start oh-my-zsh
source $ZSH/oh-my-zsh.sh


# CONFIGURATION
#####################

# Enable vim mode
bindkey -v
export KEYTIMEOUT=1

# Use neovim, if present
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# Add some color
alias grep="grep --color=auto"
alias diff="diff --color=auto"

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
	intellij() {
		open -na "IntelliJ IDEA CE.app" --args "$@"
	}
	[ -d "$app/IntelliJ IDEA CE.app" ] && alias idea=intellij
fi
unset app


# PROMPT
#####################

# Start Starship shell (https://github.com/starship/starship)
command -v starship >/dev/null && eval "$(starship init zsh)"
