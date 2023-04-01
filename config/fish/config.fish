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

# asdf
if test -e /etc/os-release
    # WSL
    source ~/.asdf/asdf.fish
else
    # MacOS
    source (brew --prefix asdf)/libexec/asdf.fish
end

# vim
alias vi='nvim'
alias vim='nvim'

# yarn
set PATH $PATH (yarn global bin)

# act
set PATH $PATH $HOME/bin

if test -e /etc/os-release
    # WSL
    # ReactNative
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

# github
alias pr-main='gh pr create --base main --head staging --title "Production Release" --body ""'
alias pr-staging='gh pr create --base staging --head develop --title "Staging Release" --body ""'
alias pr-develop='gh pr create --title "Develop Release" --body ""'

# tmux
if test -z (echo $TMUX)
    cd ~
    tmux new-session
end
