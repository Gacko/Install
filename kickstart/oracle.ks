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

-NetworkManager-config-server
-acl
-biosdevname
-btrfs-progs
-chrony
-dhclient
-firewalld
-grubby
-iprutils
-kbd
-kexec-tools
-linux-firmware
-parted
-plymouth
-rootfiles
-rsyslog
-sudo
-vim-minimal
-xfsprogs

nano
oraclelinux-release-el7

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

%post

#!/bin/sh
# Remove UEK kernel.
yum autoremove --assumeyes kernel-uek

# Set default kernel.
sed -i.bak 's/DEFAULTKERNEL=kernel-uek/DEFAULTKERNEL=kernel/g' /etc/sysconfig/kernel

# Make Grub config.
grub2-mkconfig --output /boot/grub2/grub.cfg

%end
