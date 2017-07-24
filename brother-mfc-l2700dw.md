# Instalar Driver

En el AUR hi ha un driver que no funciona. La solucio es descarregar el driver de
la MFC-D2720DW i en el PKGBUILD canviar els sources i MD5s per els del 2700.

Instalar el paquet normalment.

# Instalar Impresora

En la Web UI de CUPS, instalar la impresora

- Seleccionar conectar per HTTP (NO EL AUTOMATICAMENT TROBAT)
- La ip sera socket://LA-IP-QUE-SIGA:9100
- El driver el MFC-L2700DW (NO EL QUE DIU "driverless"!!)

Amb aixo deuria funcionar

# Scanner

Instalar "brscan4" del AUR

Instalar el Scanner amb:

sudo brsaneconfig4 -a name="Brother" model="MFC-L2700DW" ip=LA-IP-QUE-SIGA

I escanejar amb algo com "simple-scan"

# Misc

Per a vore les impresores desde GTK, instalar `gtk3-print-backends`
