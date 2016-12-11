# Basic
text
cdrom

# Partition
ignoredisk --only-use=sda
zerombr
clearpart --drives=sda --all
bootloader --boot-drive=sda --location=mbr --append="crashkernel=auto"
autopart --type=lvm

# Localization
timezone Europe/Berlin --isUtc
lang de_DE.UTF-8
keyboard --vckeymap=de-nodeadkeys --xlayouts="de (nodeadkeys)"

# Authorization
auth --enableshadow --passalgo=sha512
rootpw "toor"

# Network
network --bootproto=dhcp --device=eth0 --activate

# Reboot
reboot --eject

%packages

@^minimal
@core
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb="auto"

%end
