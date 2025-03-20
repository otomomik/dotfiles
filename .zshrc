export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  git
  zsh-autosuggestions
  history-search-multi-word
)
source $ZSH/oh-my-zsh.sh

# workspace
alias ws='cd ~/workspace'

# cd
alias ..="cd .."
alias ..1=".."
alias ..2=".. && .."
alias ..3=".. && .. && .."
alias ..4=".. && .. && .. && .."
alias ..5=".. && .. && .. && .. && .."
alias ..6=".. && .. && .. && .. && .. && .."

eval "$(mise activate zsh)"
