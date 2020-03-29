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
chsh -s $(which zsh)
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -q
sh install.sh --unattended
cat zshrc.aliases >> ~/.zshrc


# BASIC PACKAGES

# install basic packages 
sudo dnf install $(cat fedora.packages) -y -q
# install python packages
pip install --user -q $(cat python.packages)
# grab all flatpak to install
flatpak install flathub $(cat flathub.packages) -y --noninteractive

# DESKTOP

if [ $1 = $GNOME_DESKTOP ]
then
	sudo dnf remove $(cat plasma.packages) -y -q 
	#flatpak uninstall $(cat plasma_flatpak.packages) -y --noninteractive

	sudo dnf install $(cat gnome.packages) -y -q
	sudo systemctl enable gdm
	flatpak install flathub $(cat gnome_flatpak.packages) -y --noninteractive
	
elif [ $1 = $PLASMA_DESKTOP ]
then
	sudo dnf remove $(cat gnome.packages) -y  -q
	sudo dnf remove gnome-* gdm tracker-miners gtk3 -y -q
	#flatpak uninstall $(cat gnome_flatpak.packages) -y  --noninteractive

	sudo dnf install $(cat plasma.packages) -y -q
	sudo systemctl enable sddm.service
	flatpak install flathub $(cat plasma_flatpak.packages) -y --noninteractive
	 
fi

# OTHERs

# install visual studio code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update -q
sudo dnf install code -y -q




