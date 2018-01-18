# Basic
text
cdrom

# Network
%include /tmp/network.ks

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

# Reboot
reboot --eject

%packages --nocore

@core --nodefaults

-biosdevname
-btrfs-progs
-chrony
-firewalld
-iprutils
-kexec-tools
-plymouth
-sudo
-vim-minimal

avahi
nano

%end

%pre

#!/bin/sh
for argument in `cat /proc/cmdline`
do
  case "$argument" in
    hostname=*)
      echo "network --$argument" > /tmp/network.ks
      ;;
  esac;
done

%end
