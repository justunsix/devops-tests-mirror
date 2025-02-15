pkg install -y git
git clone --depth 1 https://git.FreeBSD.org/ports.git /usr/ports

# Virtualbox integration
# https://docs.freebsd.org/en/books/handbook/virtualization/#virtualization-guest-virtualbox
# cd /usr/ports/emulators/virtualbox-ose-additions && make install clean
# echo 'vboxguest_enable="YES"' >>/etc/rc.conf
# echo 'vboxservice_enable="YES"' >>/etc/rc.conf
