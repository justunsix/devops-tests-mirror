# FreeBSD Vagrantfiles

## Usage

```sh
# Turn on VM
vagrant up

# Enter VM
vagrant ssh
```

### FreeBSD 14

```sh
sudo pkg install -y nushell #Other packages as needed
```

### FreeBSD 15 Current

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

## See Also

- [Official Vagrant FreeBSD Images](https://forums.freebsd.org/threads/official-vagrant-freebsd-images.52717/)
- [Vagrantfile - FreeBSD - GitHub Gist](https://gist.github.com/jwhulette/76d37c084b29941eae3a21311abffb75)
- [FreeBSD Quickstart Guide for Linux Users](https://docs.freebsd.org/en/articles/linux-users/)
