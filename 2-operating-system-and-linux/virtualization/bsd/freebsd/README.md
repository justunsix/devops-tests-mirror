# FreeBSD Vagrantfiles

## Usage

```sh
# Turn on VM
vagrant up

# Enter VM
vagrant ssh
```

```sh
# Inside VM

# Login as root, use password: vagrant
su
# Install pkg and a different shell and doas
# (administrator delegated rights) command
pkg install -y nushell doas
vi /usr/local/etc/doas.conf.example
# Allow vagrant user to execute root command

# Log in back as vagrant
# Install other packages, use password vagrant
doas pkg install -y helix git stow helix broot yazi starship carapace atuin broot

```
