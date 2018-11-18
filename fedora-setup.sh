#!/usr/bin/bash
cd ~
# install flahub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# install winepak repository
flatpak remote-add --if-not-exists winepak https://dl.winepak.org/repo/winepak.flatpakrepo
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Update cache for package installs
sudo dnf makecache
# Install Rstudio
sudo dnf install https://download1.rstudio.org/rstudio-1.1.463-x86_64.rpm -y
# grab all packages to install
sudo dnf install $(cat ~/fedora.packages) -y

# install python packages
pip3 --user install $(cat ~/python.packages)
pip --user install $(cat ~/python2.packages)

# grab all flatpak to install
flatpak install flathub $(cat ~/flathub.packages) -y

# download anaconda
wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
bash Anaconda3-5.3.0-Linux-x86_64.sh

# web development (Mariadb)

sudo /usr/bin/mysql_secure_installation
