# Running an interactive Busybox container

You can launch an interactive shell to the container by using the `-it` option.
- The `-i` option specify that you want an interactive session.
- The `-t` option allocates a pseudo  terminal connected to the container.

Execute:

> `docker run -it busybox`{{execute T1}}

Execute the command `hostname`{{execute T1}} in the busybox container. The container ID of your container will be used as the hostname of your container.

Sample output:
```
/ # hostname
bd835eb307ab
```
Your output will be different than the one shown above as you will get different a container ID.

Try the following commands in the busybox container's shell
- `whoami`{{execute T1}}

- `pwd`{{execute T1}}

- `ps`{{execute T1}}

- `echo 'hello 12345'`{{execute T1}}

- `ping google.com`{{execute T1}}. Press Ctrl+C to stop the ping command.

Exit the docker container.

> `exit`{{execute T1}}

You may visit the https://busybox.net/downloads/BusyBox.html to understand more about the Linux commands available in Busybox 
