# Assign a name for the container

Previously, a container name will be randomly generated for your containers (e.g. romantic_edison, unruffled_cannon). You may assign a name for your container using the `--name` switch. For instance, to create a container named  `mybusybox` from the busybox image, execute:

> `docker run --name mybusybox busybox ls`{{execute T1}}

Check that the name of the container that you have launched is `mybusybox`. Execute

> `docker ps -a`{{execute T1}}

What happens if you create another container with the same name?

> `docker run --name mybusybox busybox ls`{{execute T1}}

To create a new container with the same name, you should first remove the previous container.  You may remove  the container with by using the container name. Execute

> `docker rm mybusybox`{{execute T1}}

Execute the following command to start another container with the same name. Execute:

> `docker run --name mybusybox busybox ls`{{execute T1}}

Check that a new busybox container is created. Execute:

> `docker ps -a`{{execute T1}}
