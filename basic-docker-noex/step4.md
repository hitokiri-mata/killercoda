# Running an interactive Busybox container

You can launch an interactive shell to the container by using the `-it` option.
- The `-i` option specify that you want an interactive session.
- The `-t` option allocates a pseudo  terminal connected to the container.

Execute:

> `docker run -it busybox`

Execute the command `hostname` in the busybox container. The container ID of your container will be used as the hostname of your container.

Sample output:
```
/ # hostname
bd835eb307ab
```
Your output will be different than the one shown above as you will get different a container ID.

Try the following commands in the busybox container's shell
- > `whoami`

- > `pwd`

- > `ps`

- > `echo 'hello 12345'`

- > `ping google.com` Press Ctrl+C to stop the ping command.

Exit the docker container.

> `exit`

You may visit the https://busybox.net/downloads/BusyBox.html to understand more about the Linux commands available in Busybox 

<br/>
