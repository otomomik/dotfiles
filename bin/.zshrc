# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=agnoster
plugins=(
    git
    zsh-autosuggestions
    zsh-vi-mode
)
source $ZSH/oh-my-zsh.sh

# Homebrew
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. "$HOME/.asdf/asdf.sh"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# cd
alias ..="cd .."
alias ..1=".."
alias ..2=".. && .."
alias ..3=".. && .. && .."
alias ..4=".. && .. && .. && .."
alias ..5=".. && .. && .. && .. && .."
alias ..6=".. && .. && .. && .. && .. && .."

# ls
alias ll="ls -lG"
alias la="ls -laG"

# cp
alias cp="cp -p"

# rm
alias rm="rm -i"

# mv
alias mv="mv -i"

# vim
alias vi='nvim'
alias vim='nvim'

# act
export PATH="$PATH:$HOME/bin"

# bundle
alias bundle-install="bundle install --path vendor/bundle"
alias bundle-exec="bundle exec"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# workspace
alias ws='cd ~/workspace'

