#!/bin/bash

ln -snfv ~/dotfiles/.zshrc ~/
ln -snfv ~/dotfiles/.tmux.conf ~/

ln -snfv ~/dotfiles/tmux ~/.tmux
ln -snfv ~/dotfiles/vsnip ~/.vsnip

if [ ! -d "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi

ln -snfv ~/dotfiles/config/nvim ~/.config/nvim
ln -snfv ~/dotfiles/config/wezterm ~/.config/wezterm

