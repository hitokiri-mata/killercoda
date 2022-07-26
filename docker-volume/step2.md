# Removing our container

What happens if we remove our c1 container?

Execute:

> `docker rm -f c1`{{execute}}

The `-f` option will perform a "force removal" of a running container. It will stop the container (if it is running) and then remove the container.

Run the `ls` command again. 

Does the file "hello.txt" exists in the **UpperDir** folder?

