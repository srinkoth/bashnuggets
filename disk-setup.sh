#!/bin/bash

###### This script sets up LVM, creates an XFS formatted disk and mounts it to /data and adds a entry to fstab to ensure that the disk is mounted upon reboot.

## Install ansible 
apt install -y ansible

# Set up lvm. Change device name if necessary.
pvcreate /dev/xvdb 
vgcreate vg-data /dev/xvdb
lvcreate -n lv-data -l +100%FREE vg-data
mkfs.xfs /dev/vg-data/lv-data
mkdir -p /data

# Mount volume and add entry to fstab.
ansible -vv all -i "localhost," -c local -m mount -a 'name=/data src=/dev/vg-data/lv-data fstype=xfs opts=defaults,nofail state=mounted passno=2'

