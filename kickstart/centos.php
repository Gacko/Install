# Basic
text
cdrom

# Network
network --device=eth1 --bootproto=dhcp --hostname=<?= $_GET["hostname"] ?> --activate

# Partition
ignoredisk --only-use=sda
zerombr
clearpart --drives=sda --all
bootloader --boot-drive=sda --location=mbr
autopart --type=lvm

# Localization
timezone Europe/Berlin --isUtc
lang de_DE.UTF-8
keyboard --vckeymap=de-nodeadkeys --xlayouts="de (nodeadkeys)"

# Authorization
auth --enableshadow --passalgo=sha512
rootpw "toor"

# Security
selinux --disabled
firewall --disabled

# Reboot
reboot --eject

%packages

@^minimal
@core

%end
