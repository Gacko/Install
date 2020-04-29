# Basic
text
cdrom

# Partition
ignoredisk --only-use=sda
zerombr
clearpart --drives=sda --all
bootloader --boot-drive=sda --location=mbr
autopart --type=lvm --fstype=ext4

# Localization
timezone Europe/Berlin --isUtc
lang de_DE.UTF-8
keyboard --vckeymap=de-nodeadkeys --xlayouts="de (nodeadkeys)"

# Authorization
auth --enableshadow --passalgo=sha512
rootpw "toor"

# Security
selinux --disabled

# Reboot
reboot --eject

%packages --nocore

@core --nodefaults

-btrfs-progs
-dhclient
-firewalld
-iprutils
-kbd
-kexec-tools
-parted
-plymouth
-rsyslog
-sudo
-vim-minimal
-xfsprogs

nano

%end
