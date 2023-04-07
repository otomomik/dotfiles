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

# homebrew
if test -e /etc/os-release
  # WSL
else
  # MacOS
  eval (/opt/homebrew/bin/brew shellenv)
end

source ~/.asdf/asdf.fish

# vim
alias vi='nvim'
alias vim='nvim'

# yarn
set PATH $PATH (yarn global bin)

# act
set PATH $PATH $HOME/bin

# act
if test -e /etc/os-release
  # WSL
  set PATH $PATH $HOME/bin
else
  # MacOS
end

# ReactNative
if test -e /etc/os-release
  # WSL
  set JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
  set ANDROID_HOME $HOME/Android
  set ANDROID_SDK_ROOT $ANDROID_HOME
  set PATH $PATH $JAVA_HOME/bin $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools
  alias react-native-start="yarn start --host 127.0.0.1"
  alias react-native-android="yarn android --variant=debug --deviceId emulator-5554"
end

# bundle
alias bundle-install="bundle install --path vendor/bundle"
alias bundle-exec="bundle exec"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# workspace
alias ws='cd ~/workspace'

# fisher
if not test -e ~/.config/fish/fisher/install.fish
  echo "fisher install"
  mkdir ~/.config/fish/fisher
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish > ~/.config/fish/fisher/install.fish
  source ~/.config/fish/fisher/install.fish
end
if not test -e ~/.config/fish/fisher/jorgebucaran-fisher
  source ~/.config/fish/fisher/install.fish
  fisher install jorgebucaran/fisher
  touch ~/.config/fish/fisher/jorgebucaran-fisher
end
if not test -e ~/.config/fish/fisher/oh-my-fish-theme-bobthefish
  source ~/.config/fish/fisher/install.fish
  fisher install oh-my-fish/theme-bobthefish
  touch ~/.config/fish/fisher/oh-my-fish-theme-bobthefish
end

cd ~
