#!/usr/bin/bash
dir=$(pwd)
cd $dir

# install flahub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# install winepak repository
flatpak remote-add --if-not-exists winepak https://dl.winepak.org/repo/winepak.flatpakrepo

# install RPMFusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# update fedora
sudo dnf upgrade

# grab all packages to install
sudo dnf install $(cat fedora.packages) -y 

# uses zsh instead of bash 
chsh -s $(which zsh)

# install python packages
pip3 install --user $(cat python.packages)

# grab all flatpak to install
flatpak install flathub $(cat flathub.packages) -y

# install visual studio code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

# web development (Mariadb)
sudo /usr/bin/mysql_secure_installation

# setup my aliases
cat ~/zshrc.aliases >> ~/.zshrc

# generate ssh key
ssh-keygen