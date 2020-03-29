# fedora-setup

those scripts allow to setup a fedora workstation with the desktop environment of your choice 

## utilisation


```sh  
	cd fedora-setup
	chmod +x install_setup.sh
	sudo ./install_setup.sh [DESKTOP_ENV]
```

You can choose the desktop envionment of your choice with the DESKTOP_ENV parameter : 
- GNOME
- PLASMA

```sh  
	sudo ./install_setup.sh GNOME
```

You can change the desktop environment by running the script with an other DESKTOP_ENV parameter :

```sh  
	sudo ./install_setup.sh PLASMA
```

Instaled packages are parametrable with the configuration file : 
- fedora.packages : rpm packages installed for any desktop env
- gnome.packages : rpm packages installed for the gnome desktop
- plasma.packages : rpm packages installed for the plasma desktop

- flathub.packages : flathub packages installed for any desktop env
- gnome_flatpak.packages : flathub packages installed for the gnome desktop
- plasma_flatpak.packages : flathub packages installed for the plasma desktop

- python.packages : pip packages installed 

## Todo 

- [ ] automatically install R packages
- [ ] parameter syncthing
- [ ] make the used shell as a parameter



