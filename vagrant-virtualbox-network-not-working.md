# Network doesn't work, interface vboxnet\* is DOWN

For some reason in some versions of vitualbox started interfaces are
DOWN by default. Run start them

```
ip link set vboxnet0 up
```
