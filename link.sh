#!/bin/bash

ln -snfv ~/dotfiles/.zshrc ~/
ln -snfv ~/dotfiles/.tmux.conf ~/

rm -rf ~/.tmux
ln -snfv ~/dotfiles/tmux ~/.tmux
rm -rf ~/.vsnip
ln -snfv ~/dotfiles/vsnip ~/.vsnip

if [ ! -d "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi

ln -snfv ~/dotfiles/config/nvim ~/.config/nvim
ln -snfv ~/dotfiles/config/wezterm ~/.config/wezterm

