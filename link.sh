#!/bin/bash

ln -snfv ~/dotfiles/.zshrc ~/
ln -snfv ~/dotfiles/.tmux.conf ~/

if [ ! -d "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi

ln -s ~/dotfiles/config/nvim ~/.config/nvim
ln -s ~/dotfiles/config/wezterm ~/.config/wezterm

