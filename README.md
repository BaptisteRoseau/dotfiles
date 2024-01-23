# Dotfiles

These are my own dotfiles mainly for VSCode, neovim, tmux, Git and some custom tools.

## Installation

Run the [remote-setup](scripts/remote-setup) script with the following. `git` must be installed.

```sh
curl -sfL https://raw.githubusercontent.com/BaptisteRoseau/dotfiles/main/scripts/remote-setup | bash -
source ~/.bash_profile
```

If you prefer installing manually, clone the repository under .local/dotfiles, then run the [setup](scripts/setup) script:

```sh
git clone https://github.com/BaptisteRoseau/dotfiles.git ~/.local/share/dotfiles
~/.local/share/dotfiles/script/setup
```

The install script **won't overwrite your existing dotfiles**, but will symlink
the ones that don't exist. If you want to replace your existing dotfiles, simply
move them to a backup location and run install again.

## Neovim

If Neovim is not installed on your system, you can install it as a user with:

```sh
curl -sfL https://raw.githubusercontent.com/BaptisteRoseau/dotfiles/main/scripts/install-neovim | bash -
```
## Shout-out

- Inspired from Mislav's configuration files: <https://github.com/mislav/dotfiles>.
- Tmux configuration from gpakosz: <https://github.com/gpakosz/.tmux>.
- TJ's kickstart.nvim: <https://github.com/nvim-lua/kickstart.nvim>
- CEA HPC's Modules: <https://github.com/cea-hpc/modules>
