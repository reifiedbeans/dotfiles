# dotfiles

These are my personal dotfiles that I use to configure all my computers for development. These dotfiles use [oh-my-zsh][oh-my-zsh] for a lot of the foundation, while adding extra functionality and configurations via dotfiles in the [`.config`](.config) directory. I mainly use macOS and WSL2, so Linux users beware.

## Prerequisites
- [`zsh`][zsh] (shell)
- [`starship`][starship] (prompt)
- `git` (source control)

If you're using macOS, `zsh` is probably already installed and set as your default shell. For Mac users, I recommend installing `starship` using [Homebrew][homebrew].
```bash
brew install starship
```

## Usage

First, checkout the repository, including all the submodules.
```bash
git clone --recurse-submodules https://github.com/bointer/dotfiles .dotfiles
```

I like to clone my dotfiles into a directory called `.dotfiles`. Next, invoke the setup script.
```bash
zsh .dotfiles/setup.zsh
```
This script will "[symlink][symlinks-wikipedia]" the `.config` directory and the `.zshenv` file to your home directory, enabling the dotfiles to be executed on shell startup. The script will also make sure you are using `zsh` (and change your shell if necessary). Once it finishes, you're ready to go!

In terms of customization, I've documented most of the files pretty well, so feel free to tinker with it to make it your own. In particular, you may want to create a [`.zshrc.local`][zshrc-local] file in the [`.config/zsh`](.config/zsh) directory to configure things on a machine-by-machine basis.

## Contributing

These are _my_ dotfiles, so I probably will not accept any pull requests or issues. However, if you don't like something, feel free to [fork][fork-me] this repo and do it your own way.

## License

These dotfiles are licensed under the [MIT License](LICENSE) so that others can build off of them and tweak things as they see fit.

[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[zsh]: https://www.zsh.org
[starship]: https://starship.rs
[homebrew]: https://brew.sh
[symlinks-wikipedia]: https://en.wikipedia.org/wiki/Symbolic_link#POSIX_and_Unix-like_operating_systems
[zshrc-local]: https://github.com/bointer/dotfiles/blob/1571c001b591b5513e62fc759a8a0d8d99a5dc69/.config/zsh/.zshrc#L66
[fork-me]: https://github.com/bointer/dotfiles/fork
