#! /bin/bash

# Install Packages
sudo pacman --noconfirm -S --needed - < package.list

# Install AUR packages
while read url
do
	git clone $url
	package="$(echo $url | grep -o '[^/]*$')"
	package="$(cut -d "." -f 1 <<< $package)"
	cd $package
	makepkg -si
	cd ..
done < AUR.list

# Make needed directories
mkdir -p ~/.emacs.d
mkdir -p ~/.config/i3

# Setup configuration files
rm -f ~/.xinitrc ~/.bashrc ~/.Xdefaults ~/.emacs.d/init.el
ln xinitrc ~/.xinitrc
ln bashrc ~/.bashrc
ln Xdefaults ~/.Xdefaults
ln init.el ~/.emacs.d/init.el
ln i3-config ~/.config/i3/config

# Start/Enable Daemons
systemctl start --user emacs
systemctl enable --user emacs
sudo systemctl start sshd
sudo systemctl enable sshd

# Generate ssh key
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N ""
