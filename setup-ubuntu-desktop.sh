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
