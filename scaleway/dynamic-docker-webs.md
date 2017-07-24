## Installing

First get all the files, including the `reverse-proxy` directory of course.

Then install haproxy

```
pacman -S haproxy
systemctl enable haproxy
systemctl start haproxy
```

If something fails, just run `haproxy` and see if something is missing (e.g. openssl)

Run the script that builds the haproxy database

```
cd ~/reverse-proxy
./run.sh
```

And then just start adding sites

```
cd ~/static-sites/SOME-SITE
./build.sh
./run.sh
```
