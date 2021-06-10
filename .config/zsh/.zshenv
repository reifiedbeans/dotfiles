# Clean up home directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
[ -d "$XDG_DATA_HOME" ] || mkdir -p "$XDG_DATA_HOME"
[ -d "$XDG_CACHE_HOME" ] || mkdir -p "$XDG_CACHE_HOME"

# Set location for zsh configurations
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Disable .zsh_sessions in macOS
SHELL_SESSIONS_DISABLE=1
