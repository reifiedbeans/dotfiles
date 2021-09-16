#!/bin/zsh

# Link to home directory
dotfiles_dir=$(dirname "$0":A)
ln -s "$dotfiles_dir/.zshenv" "$HOME/.zshenv"
ln -s "$dotfiles_dir/.config" "$HOME/.config"

# Set shell to zsh if not already
if [[ "$SHELL" != *zsh ]]; then
	echo "Setting shell to zsh..."
	chsh -s /bin/zsh
	echo "You may have to log out and back in again for your shell change to take effect"
fi

echo "You're all set!"

# Restart shell
exec zsh --login
