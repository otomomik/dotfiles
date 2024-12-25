#!/bin/bash

# 前提
# homebrewをインストールしていること

echo 'source ~/.zshrc' >> ~/.zprofile

brew install --cask arc docker wezterm 1password raycast
brew install wget tmux helix huggingface-cli asdf ollama gh
wget -O ./tmux/iceberg_minimal.tmux.conf https://raw.githubusercontent.com/gkeep/iceberg-dark/master/.tmux/iceberg_minimal.tmux.conf
