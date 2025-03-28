#!/bin/bash

# 前提
# homebrewをインストールしていること
# zshを使用していること

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/history-search-multi-word.git ~/.oh-my-zsh/custom/plugins/history-search-multi-word

brew install --cask arc wezterm 1password raycast slack scroll-reverser alt-tab
brew install wget tmux gh mise lazysql
wget -O ./tmux/iceberg_minimal.tmux.conf https://raw.githubusercontent.com/gkeep/iceberg-dark/master/.tmux/iceberg_minimal.tmux.conf
