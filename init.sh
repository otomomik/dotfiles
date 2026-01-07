#!/bin/bash

# 前提
# homebrewをインストールしていること
# zshを使用していること

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/history-search-multi-word.git ~/.oh-my-zsh/custom/plugins/history-search-multi-word

# utility
brew install --cask 1password raycast slack alt-tab claude
# development
brew install --cask wezterm orbstack
brew install wget tmux gh mise lazysql ripgrep fd
wget -O ./tmux/iceberg_minimal.tmux.conf https://raw.githubusercontent.com/gkeep/iceberg-dark/master/.tmux/iceberg_minimal.tmux.conf
# browser
rew install --cask arc google-chrome
