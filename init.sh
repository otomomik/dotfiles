#!/bin/bash

# 後処理
# - wezterm.luaの設置（Windowsの場合）
#     /c/Program Files/WezTermにwezterm.luaをコピーする

if [ "$(uname)" == 'Darwin' ]; then
  echo 'MacOS'

  # xcode-selectのインストール
  xcode-select --install

  # homebrewのインストール
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # bat・exaのインストール
  brew install bat exa

  # asdfのインストール
  brew install coreutils curl git

  # tmuxのインストール
  brew install tmux

  # yarnに必要なライブラリのインストール
  brew install gpg

  # denoに必要なライブラリのインストール
  brew install gpg unzip

  # rubyに必要なライブラリのインストール
  brew install openssl@1.1 readline libyaml gmp
  brew install openssl@3 readline libyaml gmp
  brew install bison openssl@3 readline libyaml gmp

  # phpに必要なライブラリのインストール
  brew install autoconf automake bison freetype gd gettext icu4c krb5 libedit libiconv libjpeg libpng libxml2 libzip openssl@1.1 pkg-config re2c zlib libsodium wget oniguruma
  
  # goに必要なライブラリのインストール
  brew install coreutils

  # swiftに必要なライブラリのインストール
  brew install swiftformat

  # dockerのインストール
  brew install --cask docker

  # Github CLIのインストール
  brew install gh

  # neovimのインストール
  brew install fd ripgrep
  brew tap homebrew/cask-fonts
  brew install font-hack-nerd-font

  # actのインストール
  brew install act

  # VSCodeの設定
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
  defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
  defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false         # For VS Codium
  defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
  defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default
  defaults write com.apple.Dock autohide-delay -float 60; killall Dock
  # defaults write com.apple.Dock autohide-delay; killall Dock
elif [ "$(uname)" == 'Linux' ]; then
  echo 'Linux'

  read -sp "password:" password

  # aptのアップデート
  echo "${password}" | sudo -S apt-get -y update
  sudo apt-get -y upgrade

  # bat・exaのインストール
  sudo apt -y install bat exa

  # tmuxのインストール
  sudo apt -y install tmux

  # zshのインストール
  sudo apt -y install zsh
  
  # nodejsに必要なライブラリのインストール
  sudo apt -y install dirmngr gpg curl gawk

  # denoに必要なライブラリのインストール
  sudo apt -y install zip unzip

  # rubyに必要なライブラリのインストール
  sudo apt -y install autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

  # rustに必要なライブラリのインストール
  sudo apt -y install libwebkit2gtk-4.0-dev build-essential curl wget libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev
  
  # phpに必要なライブラリのインストール
  sudo apt-get -y update
  sudo apt-get -y install autoconf bison build-essential curl gettext git libgd-dev libcurl4-openssl-dev libedit-dev libicu-dev libjpeg-dev libmysqlclient-dev libonig-dev libpng-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev
  
  # goに必要なライブラリのインストール
  sudo apt -y install coreutils curl

  # dockerのインストール
  sudo apt -y update
  sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
  sudo apt -y update
  sudo apt-get -y install docker-ce docker-ce-cli containerd.io
  sudo usermod -aG docker $USER
  sudo service docker start

  # docker-composeのインストール
  sudo curl -L https://github.com/docker/compose/releases/download/v2.19.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

  # Github CLIのインストール
  type -p curl >/dev/null || sudo apt install curl -y
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt -y update \
  && sudo apt install gh -y

  # neovimのインストール
  # Nerd Fontをインストールする
  # https://www.nerdfonts.com/font-downloads
  explorer.exe https://www.nerdfonts.com/font-downloads
  sudo apt -y install fd-find ripgrep

  # actのインストール
  cd ~
  sudo curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash  

  # WSL 用の調整
  if [[ "$(uname -r)" == *microsoft* ]]; then
    echo 'WSL'
		# openjdkのインストール
    sudo apt -y install openjdk-11-jdk
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
  
    # gradleのインストール
    sudo apt -y install gradle
  
    # LinuxのCommandLineToolsのインストール
    # 最新版は https://developer.android.com/studio#command-tools から確認できる。
    cd ~
    wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
    unzip commandlinetools-linux-* -d Android
    rm -rf commandlinetools-linux-*
    cd Android
    mv cmdline-tools latest
    mkdir cmdline-tools
    mv latest cmdline-tools
    cd cmdline-tools/latest/bin
    yes | ./sdkmanager --install "platform-tools" "platforms;android-31" "build-tools;31.0.0"
    ./sdkmanager --update
    cd ~
  
    # adbコマンドをWindowsから参照するようにする
    cd ~/Android/platform-tools
    mv adb adb-linux
    ln -s /mnt/c/Users/*/AppData/Local/Android/Sdk/platform-tools/adb.exe adb
  fi
else
  echo 'Windows'
  exit
fi

# fzfのインストール
git clone https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# asdfのインストール
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
. "$HOME"/.asdf/asdf.sh

# nodejsのインストール
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# denoのインストール
asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git
asdf install deno latest
asdf global deno latest

# yarnのインストール
asdf plugin add yarn
asdf install yarn latest
asdf global yarn latest

# pnpmのインストール
asdf plugin add pnpm
asdf install pnpm latest
asdf global pnpm latest

# rustのインストール
asdf plugin add rust
asdf install rust latest
asdf global rust latest

# rubyのインストール
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest

# bundlerのインストール
gem install bundler

# pythonのインストール
asdf plugin add python
asdf install python latest
asdf global python latest
pip install pipenv

# phpのインストール
# https://github.com/asdf-community/asdf-php/blob/master/.github/workflows/workflow.yml
asdf plugin add php
asdf install php latest
asdf global php latest

# goのインストール
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang latest
asdf global golang latest

# lazygitのインストール
cd ~
git clone https://github.com/jesseduffield/lazygit.git
cd lazygit
go install

# neovimのインストール
asdf plugin add neovim
asdf install neovim stable
asdf global neovim stable

# workspaceの作成
cd ~
mkdir workspace

# tmuxの作成
cd ~
mkdir .tmux

# shellの変更
sudo sh -c "echo $(which fish) >> /etc/shells"
chsh -s $(which zsh)
