# Docker fails when mounting cgroup to rootfs: no subsystem for mount

Apparently this has to do with something called the "hierarchy", which is handled by
the init (in this case systemd). As of systemd 233 (init --version) this is an issue.

To fix it, add boot parameter in the grub config:

```
systemd.legacy_systemd_cgroup_controller=yes
```

Rebuild the grub scripts and reboot

