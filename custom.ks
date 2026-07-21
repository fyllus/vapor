lang pt_BR.UTF-8
keyboard br
timezone America/Sao_Paulo --utc

network --bootproto=dhcp --device=link --activate
graphical

ostreesetup --method=container --url=ghcr.io/fyllus/vapor:latest --osname=vapor

bootloader --location=mbr --append="quiet splash loglevel=3"
clearpart --all --initlabel
reqpart
part /boot/efi --fstype="efi" --size=600
part /boot --fstype="ext4" --size=1000
part btrfs.01 --size=1 --grow
bootloader --location=mbr
logvol / --fstype="btrfs" --name=root --vgname=fedora --size=1 --grow

user --interactive
firstboot --enable

services --enabled="gdm,NetworkManager,bluetooth"

reboot

%post --erroronfail
systemctl enable gdm.service
%end
