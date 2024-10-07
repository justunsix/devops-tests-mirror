# Troubleshooting the Vagrantfile and Ubuntu Desktop

- When running `vagrant up`
  - May require some interrupts if it hangs on the Virtualbox additions installation
    - If so, interrupt the `vagrant up` command and run `vagrant reload --provision` to continue install
- Virtualbox guest additions may be re-installed during initial boot ups. If so, reboot until screen scaling and clipboard sharing works.

