#!/bin/bash

# shell
ln -snfv $(pwd)/.zshrc ~/

# config
ln -snfv $(pwd)/config ~/.config

# tmux
ln -snfv $(pwd)/.tmux.conf ~/
ln -snfv $(pwd)/tmux ~/.tmux

# claude
mkdir -p ~/.claude/commands
ln -snfv $(pwd)/claude-commands/*.md ~/.claude/commands/
