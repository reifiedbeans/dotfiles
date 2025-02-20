#####################
# ZSH CONFIGURATION #
#####################

# Set up zsh files
ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump"
HISTFILE="$ZSH_CACHE_DIR/history"
[ -d "$ZSH_CACHE_DIR" ] || mkdir -p "$ZSH_CACHE_DIR"
[ -d "$HISTFILE" ] || touch "$HISTFILE"

# Default programs
export EDITOR='vim'

# Use neovim, if present
if command -v 'nvim' > '/dev/null'; then
	alias vim='nvim' vimdiff='nvim -d'
	export EDITOR='nvim'
fi

# Add verbose output
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias mkdir='mkdir -pv'

# Path for oh-my-zsh installation
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

# oh-my-zsh plugins
plugins=('vi-mode')

# Start oh-my-zsh
if [[ -d "$ZSH" ]]; then
	source "$ZSH/oh-my-zsh.sh"
else
	echo "Could not find oh-my-zsh at $ZSH. Consider cloning it for the best experience."
fi

# Add completions from Homebrew packages
if command -v 'brew' > '/dev/null'; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

# Load local-only .zshrc
if [[ -f "$HOME/.zshrc.local" ]]; then
	source "$HOME/.zshrc.local"
fi

# Start Starship prompt (https://github.com/starship/starship)
if command -v 'starship' > '/dev/null'; then
	eval "$(starship init zsh)"
else
	echo 'starship prompt is not installed. Consider installing it for the best experience.'
fi
