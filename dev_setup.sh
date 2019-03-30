#! /bin/bash

# Install Packages
sudo pacman -S --needed - < package.list

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

mkdir ~/.emacs.d

# Setup configuration files
rm -f ~/.xinitrc ~/.bashrc ~/.Xdefaults ~/.emacs.d/init.el
ln xinitrc ~/.xinitrc
ln bashrc ~/.bashrc
ln Xdefaults ~/.Xdefaults
ln init.el ~/.emacs.d/init.el

# Enable Daemons
systemctl enable --user emacs

# Generate ssh key
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N ""
