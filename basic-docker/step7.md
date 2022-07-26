
# Docker Commit

Start another Ubuntu container by running the Ubuntu docker image again:

> `docker run --name c2 -it ubuntu bash`{{execute}}

Execute:

> `figlet`{{execute}}

Is the `figlet` program installed in the new container? Why?

Exit the docker container.

> `exit`{{execute}}

If we need something installed in our container, we should build a custom Docker image. We can

* Use  the `docker commit`  to commit a container's file changes or settings into a new image. 

* Write a Docker file to build a Docker image. 

In this exercise, we will focus on approach 1. Execute in the terminal (replace [container ID] with the ID of the container with figlet installed):

> `docker commit c1 ubuntu-figlet`{{execute}}

Verify that a new image named  `ubuntu-figlet` is created.

> `docker image ls`{{execute}}

Execute the following  command to check if `figlet` is installed in the image.

> `docker run ubuntu-figlet figlet Hello PolyU`{{execute}}

Sample Output:

```
 _   _      _ _         ____       _       _   _ 
| | | | ___| | | ___   |  _ \ ___ | |_   _| | | |
| |_| |/ _ \ | |/ _ \  | |_) / _ \| | | | | | | |
|  _  |  __/ | | (_) | |  __/ (_) | | |_| | |_| |
|_| |_|\___|_|_|\___/  |_|   \___/|_|\__, |\___/ 
                                     |___/       
```

