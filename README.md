# Dotfiles Repository

Welcome to my personal dotfiles repository, which extends [LazyVim](https://www.lazyvim.org/), a distribution that aims to make Neovim's power more accessible without sacrificing extensibility. This setup is the result of personalization and fine-tuning to fit my workflow, enhancing the default LazyVim experience with additional configurations for Tmux and Neovim.

## Repository Structure

- `/lua/config` - Personal Neovim configurations.
- `/lua/plugins` - Additional Neovim plugins and extended settings.
- `/tmux` - Tmux configuration and pane management script.

## Setup Overview

![Setup Image](https://github.com/SamuelFanawopo/Dotfiles/assets/92785438/21a924f4-8d10-442f-a982-27fa5ac815cb)

## Neovim Configuration

The Neovim setup is designed to be modular, allowing for easy customization and updates. It leverages LazyVim's architecture and includes additional plugins for functionality such as version control with `vim-fugitive`, file navigation with `harpoon`, and more.

To get started with Neovim and LazyVim, follow the official [installation guide](https://www.lazyvim.org/installation).

## Tmux Configuration

The provided Tmux configuration includes keybindings, color scheme adjustments to match the Neovim aesthetics, and the `ide` script which automatically sets up a working environment with multiple panes.

To start using the Tmux configuration, you can link the provided `.tmux.conf` file to your home directory:

```bash
ln -s ~/Dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

For the ide pane management script, ensure it is executable and within your PATH:

```bash
cp ~/Dotfiles/tmux/ide /usr/local/bin/ide
chmod +x /usr/local/bin/ide
```

### Tmux Installation (if not already installed)

If Tmux is not installed on your system, you can typically install it using your distribution's package manager. For example, on Ubuntu:

```bash
sudo apt-get update
sudo apt-get install tmux
```

## Customization

This setup is open for further personalization. Feel free to explore the configurations and adjust them to your liking.

## Acknowledgments

A big thanks to the creators and maintainers of LazyVim, as well as all the authors of the plugins and tools included in this configuration.
