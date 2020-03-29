#!/usr/bin/bash

GNOME_DESKTOP="GNOME"
PLASMA_DESKTOP="PLASMA"

dir=$(pwd)
cd $dir


# RESOURCES

# install flahub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 
# install RPMFusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y -q
# update fedora
sudo dnf upgrade -y -q

# SHELL

# uses zsh instead of bash 
install_zsh_func(){
	chsh -s $(which zsh)
	wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -q
	sh install.sh --unattended
	cat zshrc.aliases >> ~/.zshrc
}



# BASIC PACKAGES

# install basic packages 
sudo dnf install $(cat packages/base/rpm) -y -q
# install python packages
pip install --user -q $(cat packages/base/python)
# grab all flatpak to install
flatpak install flathub $(cat packages/base/flathub) -y --noninteractive

# DESKTOP

if [ $1 = $GNOME_DESKTOP ]
then
	sudo dnf remove $(cat packages/plasma/rpm) -y -q 

	sudo dnf install $(cat packages/gnome/rpm) -y -q
	sudo systemctl enable gdm
	flatpak install flathub $(cat packages/gnome/flathub) -y --noninteractive
	
elif [ $1 = $PLASMA_DESKTOP ]
then
	sudo dnf remove $(cat packages/gnome/rpm) -y  -q
	sudo dnf remove gnome-* gdm tracker-miners gtk3 -y -q

	sudo dnf install $(cat packages/plasma/rpm) -y -q
	sudo systemctl enable sddm.service
	flatpak install flathub $(cat packages/plasma/flathub) -y --noninteractive
	 
fi

# OTHERs

# install visual studio code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update -q
sudo dnf install code -y -q

# install nvidia-driver


# Parse arguments
	while [ $# -gt 0 ]; do
		case $1 in
			--nvidia) sudo dnf install akmod-nvidia -y -q;;
			--zsh) install_zsh_func;;
		esac
		shift
	done

	


