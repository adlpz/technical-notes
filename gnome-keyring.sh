Es bona idea tindre un gestor de keys i password en el WM, per a coses com
contrassenyes de ftp i tal.

Un dels mes complets i prou desacoplat es el `gnome-keyring` 

1. Instalar gnome-keyring i libsecret (permet aplicacions utilitzar gnome-keyring)
2. Autostart al .xinitrc

```
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
export SSH_AUTH_SOCK
```

A la llista de components se li pot afegir "ssh" per a gestionar tambe les claus ssh

Amb aixo deuria funcionar
