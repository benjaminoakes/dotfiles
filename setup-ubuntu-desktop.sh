# Usage: sh setup-ubuntu-desktop.sh
#
# Purpose: Set up an Ubuntu 22.04-based desktop environment
#
# This file is intended to contain idempotent commands that are safe to run multiple times.

cat > ~/.hidden << EOF
snap
Desktop
EOF

sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt update
sudo apt install -y curl
sudo apt install -Y syncthing
sudo apt autoremove -y

sudo apt install -y flatpak
flatpak install flathub com.belmoussaoui.Authenticator

# https://docs.syncthing.net/users/autostart.html#linux
mkdir -p ~/.config/autostart/
cp /usr/share/applications/syncthing-start.desktop ~/.config/autostart/

# sudo="sudo"
#
# $sudo apt-get update
# $sudo apt-get install -y \
#   curl \
#   git \
#   gron \
#   jq \
#   less \
#   man-db \
#   openssh-client \
#   rlwrap \
#   ruby \
#   tmux \
#   tree \
#   unar \
#   vim \
#   wget \
#   zsh
# $sudo gem install --no-document homesick
#
# curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
#
# echo whoami
# whoami
#
# homesick clone benjaminoakes/homesick-vi-everywhere
# homesick symlink homesick-vi-everywhere --force
# homesick clone TigerDenHackers/dotfiles
# homesick symlink dotfiles --force
# homesick clone benjaminoakes/personal-dotfiles
# homesick symlink personal-dotfiles --force
#
# # Load my personal config, but still share the majority of TigerDenHackers/dotfiles
# mkdir -p ~/.zsh; echo 'source "$HOME/.personal/zsh/local.zsh"' > ~/.zsh/local.zsh
# mkdir -p ~/.gitconfig.d; printf "[include]\n  path = ~/.personal/gitconfig.d/user\n" > ~/.gitconfig.d/user
# mkdir -p ~/.tmux; echo 'source-file "$HOME/.personal/tmux/user.conf"' > ~/.tmux/user.conf
#
# chsh --shell /bin/zsh
# yes | vim -c :PlugInstall -c :qa
