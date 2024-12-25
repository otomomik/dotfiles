#!/bin/bash

# shell
ln -snfv $(pwd)/.zshrc ~/

# config
ln -snfv $(pwd)/config ~/.config

# tmux
ln -snfv $(pwd)/.tmux.conf ~/
ln -snfv $(pwd)/tmux ~/.tmux
