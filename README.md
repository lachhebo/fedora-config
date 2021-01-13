# fedora-setup

this script allow to setup a fedora workstation with the gnome desktop environment, zsh, and all dev depedencies i am using
## Usage

```shell
git clone https://github.com/lachhebo/fedora-config.git
ansible-galaxy install -r fedora-config/requirements.yml
ansible-galaxt collection install -r  fedora-config/requirements.yml
ansible-playbook --url https://github.com/lachhebo/fedora-config.git -i inventory -l local setup.yml 
```