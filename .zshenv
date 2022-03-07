# Set up home directory
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export YADM_DIR="$XDG_CONFIG_HOME/yadm"
export YADM_DATA="$XDG_DATA_HOME/yadm"
[ -d "$XDG_CACHE_HOME" ] || mkdir -p "$XDG_CACHE_HOME"
[ -d "$XDG_CONFIG_HOME" ] || mkdir -p "$XDG_CONFIG_HOME"
[ -d "$XDG_DATA_HOME" ] || mkdir -p "$XDG_DATA_HOME"
[ -d "$YADM_DIR" ] || mkdir -p "$YADM_DIR"
[ -d "$YADM_DATA" ] || mkdir -p "$YADM_DATA"

# Disable .zsh_sessions in macOS
SHELL_SESSIONS_DISABLE=1
