#!/bin/zsh

is_brew_installed=`which brew`
brew_list=`brew list`
brew_cask_list=`brew list --cask`

is_anyenv_installed=`which anyenv`
any_env_list=`anyenv envs`

echo "Hello.$(whoami)"

# Check shell
echo "Check your computer shell."
echo "=> $SHELL\n"

# Install Homebrew
# https://brew.sh/index_ja
function brew_install() {
  echo "Would you like to install Homebrew? [y/n]"
  read should_install_homebrew
  if [ "$should_install_homebrew" = "y" ]; then
    if [ "$is_brew_installed" = "brew not found" ]; then
      echo '=> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
      echo ""
    else
      echo "brew already exists.\n"
    fi
  fi
}

function update_brew() {
  echo "=> brew -v"
  brew -v
  echo ""

  echo "=> brew update"
  brew update
  echo ""

  echo "=> brew upgrade"
  brew upgrade
  echo ""

  echo "=> brew cask upgrade"
  brew cask upgrade
  echo ""

  echo "=> brew cleanup"
  brew cleanup
  echo ""

  echo "=> brew doctor"
  brew doctor
  echo ""
}

if [ "$is_brew_installed" = "brew not found" ]; then
  echo "Please install Homebrew."
  brew_install
  update_brew
else
  echo "Would you update brew? [y/n]"
  read should_update_brew
  if [ "$should_update_brew" = "y" ]; then
    update_brew
  else
    echo "Skipped update brew.\n"
  fi
fi

is_brew_installed=`which brew`

# brew cask install [hoge]

# Install iTerm2
# https://www.iterm2.com/
function install_iterm2() {
  if [ `echo "$brew_cask_list" | grep "iterm2"` ]; then
    echo "iTerm2 already exists.\n"
  else
    echo "=> brew cask install iterm2"
    brew cask install iterm2
    echo ""
  fi
}
echo "Would you like to install iTerm2? [y/n]"
read should_install_iterm2
if [ "$should_install_iterm2" = "y" ]; then
  if [ "$is_brew_installed" = "brew not found" ]; then
    echo "Please install Homebrew."
    brew_install
    install_iterm2
  else
    install_iterm2
  fi
fi

# Install VisualStudioCode
# https://code.visualstudio.com/
function install_visual_studio_code() {
  if [ `echo "$brew_cask_list" | grep "visual-studio-code"` ]; then
    echo "VisualStudioCode already exists.\n"
  else
   echo "=> brew cask install visual-studio-code"
   brew cask install visual-studio-code
   echo ""
  fi
}
echo "Would you like to install VisualStudioCode? [y/n]"
read should_install_visual_studio_code
if [ "$should_install_visual_studio_code" = "y" ]; then
  if [ "$is_brew_installed" = "brew not found" ]; then
    echo "Please install Homebrew."
    brew_install
    install_visual_studio_code
  else
    install_visual_studio_code
  fi
fi

# Install Docker
function install_docker() {
  if [ `echo "$brew_cask_list" | grep "docker"` ]; then
    echo "Docker already exists.\n"
  else
   echo "=> brew cask install docker"
   brew cask install docker
   echo ""
  fi
}
echo "Would you like to install Docker? [y/n]"
read should_install_docker
if [ "$should_install_docker" = "y" ]; then
  if [ "$is_brew_installed" = "brew not found" ]; then
    echo "Please install Homebrew."
    brew_install
    install_docker
  else
    install_docker
  fi
fi

# Install TablePlus
# https://docs.tableplus.com/
function install_table_plus() {
  if [ `echo "$brew_cask_list" | grep "tableplus"` ]; then
    echo "TablePlus already exists.\n"
  else
   echo "=> brew cask install tableplus"
   brew cask install tableplus
   echo ""
  fi
}
echo "Would you like to install TablePlus? [y/n]"
read should_install_tableplus
if [ "$should_install_tableplus" = "y" ]; then
  if [ "$is_brew_installed" = "brew not found" ]; then
    echo "Please install Homebrew."
    brew_install
    install_table_plus
  else
    install_table_plus
  fi
fi

# Install GoogleChrome
function install_google_chrome() {
  if [ `echo "$brew_cask_list" | grep "google-chrome"` ]; then
    echo "GoogleChrome already exists.\n"
  else
    echo "=> brew cask install google-chrome"
    brew cask install google-chrome
    echo ""
  fi
}
echo "Would you like to install GoogleChrome? [y/n]"
read should_install_google_chrome
if [ "$should_install_google_chrome" = "y" ]; then
  if [ "$is_brew_installed" = "brew not found" ]; then
    echo "Please install Homebrew."
    brew_install
    install_google_chrome
  else
    install_google_chrome
  fi
fi

# Install Slack
function install_slack() {
  if [ `echo "$brew_cask_list" | grep "slack"` ]; then
    echo "Slack already exists.\n"
  else
   echo "=> brew cask install slack"
   brew cask install slack
   echo ""
  fi
}
echo "Would you like to install Slack? [y/n]"
read should_install_slack
if [ "$should_install_slack" = "y" ]; then
  if [ "$is_brew_installed" = "brew not found" ]; then
    echo "Please install Homebrew."
    brew_install
    install_slack
  else
    install_slack
  fi
fi

# brew install [hoge]

# Install anyenv
function init_anyenv() {
  anyenv init
  echo 'eval "$(anyenv init -)"' >> ~/.zshrc
  exec $SHELL -l
  anyenv install --init
}
function install_anyenv() {
  if [ `echo "$brew_list" | grep "anyenv"` ]; then
    echo "anyenv already exists.\n"
  else
   echo "=> brew cask install anyenv"
   brew install anyenv
   init_anyenv
   echo ""
  fi
}
echo "Would you like to install anyenv? [y/n]"
read should_install_anyenv
if [ "$should_install_anyenv" = "y" ]; then
  if [ "$is_brew_installed" = "brew not found" ]; then
    echo "Please install Homebrew."
    brew_install
    install_anyenv
  else
    install_anyenv
  fi
fi

is_anyenv_installed=`which anyenv`
any_env_list=`anyenv envs`

# anyenv install [hoge]

# Install rbenv
function install_rbenv() { 
  if [ `echo "$any_env_list" | grep "rbenv"` ]; then
    echo "rbenv already exists.\n"
  else
    echo "=> anyenv install rbenv"
    anyenv install rbenv
    exec $SHELL -l
    echo ""
  fi
}
if [ "$is_anyenv_installed" = "anyenv not found" ]; then
  :
else
  echo "Would you like to install rbenv? [y/n]"
  read should_install_rbenv
  if [ "$should_install_rbenv" = "y" ]; then
    install_rbenv
  fi
fi

# Install nodenv
function install_nodenv() {
  if [ `echo "$any_env_list" | grep "nodenv"` ]; then
    echo "nodenv already exists.\n"
  else
    echo "=> anyenv install nodenv"
    anyenv install nodenv
    exec $SHELL -l
    echo ""
  fi
}
if [ "$is_anyenv_installed" = "anyenv not found" ]; then
  :
else
  echo "Would you like to install nodenv? [y/n]"
  read should_install_nodenv
  if [ "$should_install_nodenv" = "y" ]; then
    install_nodenv
  fi
fi

# [System Settings]

# Show hidden files
echo "Would you like to show hidden files? [y/n]"
read should_show_hidden_files
if [ "$should_show_hidden_files" = "y" ]; then
  echo "=> defaults write com.apple.finder AppleShowAllFiles -boolean true"
  defaults write com.apple.finder AppleShowAllFiles -boolean true
  echo "Successfully\n"
fi

# Don't create .DS_Store file
echo "Would you like to create a .DS_Store file in a shared folder? [y/n]"
read should_not_create_ds_store_file
if [ "$should_not_create_ds_store_file" = "y" ]; then
  echo "=> defaults write com.apple.desktopservices DSDontWriteNetworkStores true"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores tru
  echo "Successfully\n"
fi

# Change git editor.
echo "Would you like to setting for git? [y/n]"
read should_setting_git
if [ "$should_setting_git" ]; then
  echo "Please type git user_name."
  read git_user_name
  echo "=> git config --global user.name \"$git_user_name\""
  git config --global user.name "$git_user_name"
  echo "Successfully.\n"

  echo "Please type git email."
  read git_email
  echo "=> git config --global user.email \"$git_email\""
  git config --global user.email "$git_email"
  echo "Successfully.\n"

  echo "Would you like to show untracked files? [y/n]"
  read should_show_untracked_files
  if [ "$should_show_untracked_files" ]; then
    echo "=> git config --global status.showUntrackedFiles all"
    git config --global status.showUntrackedFiles all
    echo "Successfully.\n"
  fi

  echo "=> git config --global color.ui true"
  git config --global color.ui true
  echo "Successfully.\n"

  echo "=> git config --global color.diff auto"
  git config --global color.diff auto
  echo "Successfully.\n"

  echo "=> git config --global color.status auto"
  git config --global color.status auto
  echo "Successfully.\n"

  echo "=> git config --global color.branch auto"
  git config --global color.branch auto
  echo "Successfully.\n"

  echo "Would you like to use vim for your git editor? [y/n]"
  read should_change_git_editor
  if [ "$should_change_git_editor" = "y" ]; then
    echo "=> git config --global core.editor vim"
    git config --global core.editor vim
    echo "Successfully\n"
  fi
fi

echo "=> sudo chown -R $(whoami):staff ~/.ssh"
sudo chown -R $(whoami):staff ~/.ssh
echo "Successfully.\n"

echo "=> sudo chmod 700 ~/.ssh"
sudo chmod 700 ~/.ssh
echo "Successfully.\n"

echo "=> sudo chmod -R 600 ~/.ssh/*"
sudo chmod -R 600 ~/.ssh/*
echo "Successfully.\n"

# Source List
# - [Mac を買ったら必ずやっておきたい初期設定](https://qiita.com/ucan-lab/items/c1a12c20c878d6fb1e21)
# - [初心者向けシェルスクリプトの基本コマンドの紹介](https://qiita.com/zayarwinttun/items/0dae4cb66d8f4bd2a337#%E5%9F%BA%E6%9C%AC%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89)
# - [bashコーディング規約](https://qiita.com/mashumashu/items/f5b5ff62fef8af0859c5)