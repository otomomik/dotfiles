#!/bin/bash

# 事前準備
# https://reactnative.dev/docs/environment-setup
# AndroidStudioをインストールし、環境変数を設定する（WSLの場合）
#  ANDROID_HOMEは不要
#  PATH = %LOCALAPPDATA%\Android\Sdk\platform-tools
# 
# Homebrewをインストールする（MacOSの場合）
#   https://brew.sh/index_ja
# WezTermのインストール
#   https://wezfurlong.org/wezterm/

# 後処理
# ターミナルを再起動した後に行うこと
# - bundlerのインストール（MacOSの場合）
#     gem install bundler
# - wezterm.luaの設置
#     /c/Program Files/WezTermにwezterm.luaをコピーする

# 起動方法
# bash setup.sh

if [ "$(uname)" == 'Darwin' ]; then
  echo 'MacOS'
  # linkを実行
  bash link.sh

  # tmuxのインストール
  yes | brew install tmux  

  # vimのインストール
  yes | brew install vim

  # fishのインストール
  yes | brew install fish

  # asdfのインストール
  yes | brew install coreutils curl git
  yes | brew install asdf
  source $(brew --prefix asdf)/libexec/asdf.sh

  # nodejsのインストール
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs latest
  asdf global nodejs latest

  # denoのインストール
  asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git
  asdf install deno latest
  asdf global deno latest

  # yarnのインストール
  yes | brew install gpg
  asdf plugin add yarn
  asdf install yarn latest
  asdf global yarn latest

  # rustのインストール
  asdf plugin add rust
  asdf install rust latest
  asdf global rust latest

  # rubyのインストール
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  asdf install ruby latest
  asdf global ruby latest

  # pythonのインストール
  asdf plugin add python
  asdf install python latest
  asdf global python latest
  pip install pipenv

  # dockerのインストール
  yes | brew install --cask docker

  # Github CLIのインストール
  yes | brew install gh

  # neovimのインストール
  yes | brew install fzf fd ripgrep
  yes | brew tap homebrew/cask-fonts
  yes | brew install font-hack-nerd-font
  asdf plugin add neovim
  asdf install neovim stable
  asdf global neovim stable

  # workspaceの作成
  cd ~
  mkdir workspace

  # actのインストール
  yes | brew install act

  # minioのインストール
  cd ~
  mkdir minio
  cd ./minio
  mkdir data
  yes | brew install minio/stable/minio

  # VSCodeの設定
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
  defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

  # shellの変更
  sudo sh -c "echo $(which fish) >> /etc/shells"
  chsh -s $(which fish)
  
elif [ "$(uname)" == 'Linux' ]; then
  echo 'Linux'
	# passwordを要求
  read -sp "password:" password
  
  # linkを実行
  bash link.sh
  
  # aptのアップデート
  echo "${password}" | sudo -S apt-get update
  yes | sudo apt-get upgrade
  
  # tmuxのインストール
  yes | sudo apt install tmux
  
  # vimのインストール
  yes | sudo apt install vim
  
  # fishのインストール
  yes | sudo apt install fish
  echo "${password}" | chsh -s $(which fish)
  
  # asdfのインストール
  yes | sudo apt install curl git
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
  source $HOME/.asdf/asdf.sh
  mkdir -p ~/.config/fish/completions && ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
  
  # nodejsのインストール
  yes | sudo apt install dirmngr gpg curl gawk
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
  
  # rustのインストール
  yes | sudo apt install libwebkit2gtk-4.0-dev build-essential curl wget libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev
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
  # GPUを使う場合は以下を参考にする
  # https://zenn.dev/utahka/articles/ed881a568246f4

  # dockerのインストール
  yes | sudo apt update
  yes | sudo apt install \
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
  yes | sudo apt update
  yes | sudo apt-get install docker-ce docker-ce-cli containerd.io
  sudo usermod -aG docker $USER
  sudo service docker start

  # docker-composeのインストール
  sudo curl -L https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

  # Github CLIのインストール
  type -p curl >/dev/null || sudo apt install curl -y
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

  # neovimのインストール
  # Nerd Fontをインストールする
  #   https://www.nerdfonts.com/font-downloads
  explorer.exe https://www.nerdfonts.com/font-downloads
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  yes | ~/.fzf/install
  yes | sudo apt install fd-find ripgrep
  asdf plugin add neovim
  asdf install neovim stable
  asdf global neovim stable

  # workspaceの作成
  cd ~
  mkdir workspace

  # actのインストール
  cd ~
  sudo curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash  

  # minioのインストール
  cd ~
  mkdir minio
  cd ./minio
  mkdir data
  wget https://dl.min.io/server/minio/release/linux-amd64/minio
  chmod +x minio

  # WSL 用の調整
  if [[ "$(uname -r)" == *microsoft* ]]; then
    echo 'WSL'
		# openjdkのインストール
    yes | sudo apt install openjdk-11-jdk
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
  
    # gradleのインストール
    yes | sudo apt install gradle
  
    # LinuxのCommandLineToolsのインストール
    # 最新版は https://developer.android.com/studio#command-tools から確認できる。
    cd ~
    yes | sudo apt install unzip
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
  
fi
