all: install-packages install-config enable-daemons generate-ssh-key

# TODO: Install AUR packages
# while read url
# do
# 	git clone $url
# 	package="$(echo $url | grep -o '[^/]*$')"
# 	package="$(cut -d "." -f 1 <<< $package)"
# 	cd $package
# 	makepkg -si
# 	cd ..
# done < AUR.list

.PHONY: install-packages
install-packages:
	sudo pacman --noconfirm -S --needed - < package.list

.PHONY: install-config
install-config:
	mkdir -p ~/.emacs.d ~/.config/i3
	rm -f ~/.xinitrc ~/.bashrc ~/.Xdefaults ~/.emacs.d/init.el ~/.config/i3/config ~/.gitconfig
	ln xinitrc ~/.xinitrc
	ln bashrc ~/.bashrc
	ln Xdefaults ~/.Xdefaults
	ln init.el ~/.emacs.d/init.el
	ln i3-config ~/.config/i3/config
	ln gitconfig ~/.gitconfig

.PHONY: enable-daemons
enable-daemons:
	systemctl start --user emacs
	systemctl enable --user emacs
	sudo systemctl start sshd
	sudo systemctl enable sshd

.PHONY: generate-ssh-key
generate-ssh-key:
	ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N ""
