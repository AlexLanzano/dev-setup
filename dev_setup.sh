#! /bin/bash

# Install Packages
sudo pacman -S - package.list

# Install AUR packages
for url in (AUR.list)
do
	git clone $url
	package="$(echo $url | grep -o '[^/]*$')"
	package="$(cut -d "." -f 1 <<< $package)"
	cd $package
	makepkg -si
	cd ..
done

# Setup configuration files
ln xinitrc ~/.xinitrc
ln bashrc ~/.bashrc
ln Xdefaults ~/.Xdefaults
ln init.el ~/.emacs.d/init.el

# Enable Daemons
systemctl enable --user emacs
sudo systemctl enable dhcpcd
