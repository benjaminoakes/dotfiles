cat > ~/.hidden << EOF
snap
Desktop
EOF

sudo apt install -y curl
sudo apt autoremove -y

# https://docs.syncthing.net/users/autostart.html#linux
mkdir -p ~/.config/autostart/
cp /usr/share/applications/syncthing-start.desktop ~/.config/autostart/
