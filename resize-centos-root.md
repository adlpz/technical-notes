# Resize the drive from Host

In our case it was Proxmox, so I just went to the proxmox GUI and resized the drive.

# Resize the partition with `fdisk`

Run `fdisk /dev/sdX`, `p` to print the current state and copy it somewhere for reference. Delete
the partition with `d` (it has to be the last, otherwise you'd have to move things) and create a
new one with `n`. Change type with `t` selecting type `8e`, that is, `Linux LVM`. Print state with
`p` and check the partition start is the same as before. Write with `w`, will error as can't reload
the partition table (it's in use). Reboot.

# Resize LVM logical volume

Run `vgdisplay`. In the enlarged partition you'll see e.g. `Free  PE / Size  1280 / 5.00 GiB`.
Expand it with, in this case for 5GB, `lvextend -L+5G /dev/centos/root` assuming it's the logical
volume `root` in the `centos` group.

# Resize the partition

Finally resize the partition itself with `xfw_growfs /dev/centos/root` (or `resize2fs /dev/centos/root`
for `ext3`/`ext4`.

# Credits

- https://serverfault.com/questions/861517/centos-7-extend-partition-with-unallocated-space
- `https://www.rootusers.com/lvm-resize-how-to-increase-an-lvm-partition/
