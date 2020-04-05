# fedora-setup

this script allow to setup a fedora workstation with the desktop environment of your choice 

## Usage


```sh  
	cd fedora-setup
	chmod +x install_setup.sh
	./install_setup.sh [DESKTOP_ENV] [OPTIONS]
```

Instaled packages are parametrable with configurations file : 

- rpm : rpm packages installed with dnf
- flathub : flatpak packages installed from flathub repository
- python : pip packages installed 

### DESKTOP_ENV

You can choose the desktop envionment of your choice with the DESKTOP_ENV parameter : 
- GNOME
- PLASMA

```sh  
	./install_setup.sh GNOME
```

You can change the desktop environment by running the script with an other DESKTOP_ENV parameter :

```sh  
	./install_setup.sh PLASMA
```


### OPTIONS


```sh  
	--nvidia : install nvidia propietary driver
	--zsh : replace current shell with zsh and install oh-my-zsh
```


