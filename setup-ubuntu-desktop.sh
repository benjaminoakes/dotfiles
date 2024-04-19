# Usage: sh setup-ubuntu-desktop.sh
#
# This file is intended to contain idempotent commands that are safe to run multiple times.

cat > ~/.hidden << EOF
snap
Desktop
EOF

sudo apt install -y curl
sudo apt autoremove -y

# https://docs.syncthing.net/users/autostart.html#linux
mkdir -p ~/.config/autostart/
cp /usr/share/applications/syncthing-start.desktop ~/.config/autostart/
