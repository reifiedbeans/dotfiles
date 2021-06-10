#!/bin/zsh

# Link to home directory
dotfiles_dir=$(dirname "$0":A)
ln -s "$dotfiles_dir/.config/zsh/.zshenv" "$HOME/.zshenv"
ln -s "$dotfiles_dir/.config" "$HOME/.config"

# Set shell to zsh if not already
if [[ "$SHELL" != *zsh ]]; then
	echo "Setting shell to zsh..."
	chsh -s /bin/zsh
fi

echo "You're all set. Please reload your terminal for changes to effect."
