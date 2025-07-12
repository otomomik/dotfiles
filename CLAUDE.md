# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for macOS development environment setup. It contains configuration files for various development tools and automated setup scripts.

## Common Commands

### Initial Setup
```bash
# Run the initial setup (requires Homebrew and zsh)
./init.sh

# Create symlinks for all configuration files
./link.sh
```

### Package Management
The repository uses `mise` for runtime version management. Common commands:
```bash
# Install all tools defined in config/mise/config.toml
mise install

# Update all tools to latest versions
mise update
```

### Git Operations
This repository includes a custom Claude command for Japanese git commits:
```bash
# Use the custom command (available after running link.sh)
/git-japanese-commit
```

## Architecture and Structure

### Configuration Management
- **Symlink-based**: All configurations are managed through symlinks created by `link.sh`
- **XDG Base Directory**: Uses `~/.config` for most application configurations
- **Centralized**: All dotfiles are kept in this repository and linked to their appropriate locations

### Key Components

1. **Shell Environment** (.zshrc):
   - Oh My Zsh with agnoster theme
   - Plugins: git, zsh-autosuggestions, history-search-multi-word
   - Custom aliases for workspace navigation
   - mise integration for package management

2. **Terminal Setup**:
   - WezTerm as primary terminal (config/wezterm/)
   - tmux for terminal multiplexing with Iceberg theme
   - Custom tmux keybindings for vim-style navigation

3. **Editor Configurations**:
   - Neovim: LazyVim-based setup with language support for TypeScript, Python, Markdown, JSON
   - Helix: Alternative editor with kanagawa theme

4. **Development Tools**:
   - GitHub CLI (gh) configuration
   - Git global configuration and ignore patterns
   - mise for managing development tool versions

### Important Notes

- The `init.sh` script contains a typo on line 18: `rew install` should be `brew install`
- Secret management is handled through `config/secret-vault/` directory
- Claude CLI integration is set up with custom commands in `claude-commands/`
- All editor configurations follow a modular approach with plugin management

## Development Workflow

1. **Adding New Configurations**: Place files in appropriate directories under `config/` and update `link.sh` if needed
2. **Updating Tools**: Modify `config/mise/config.toml` and run `mise install`
3. **Shell Customization**: Edit `.zshrc` for aliases and environment variables
4. **Terminal Customization**: Modify `config/wezterm/wezterm.lua` or `.tmux.conf`