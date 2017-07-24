# Changing boot parameters, modules, etc
Add them to /etc/default/grub

# Custom boot scripts
You can find all scripts, including custom ones (e.g. 40_custom and 41_custom) for
reference under /etc/grub.d/

# Rebuild grub
Needed after doing any change or installing kernels withouth grub hooks.

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
