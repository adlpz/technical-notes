## Docker fails to start

If the docker systemd service fails to start and we see in the log (journalctl -xe) the following:

May 23 15:34:29 webs systemd[4232]: Failed to chown socket at step GROUP: No such process
May 23 15:34:29 webs systemd[1]: docker.socket: Control process exited, code=exited status=216
May 23 15:34:29 webs systemd[1]: Failed to listen on Docker Socket for the API.

Then just do:

`$ groupadd docker`


