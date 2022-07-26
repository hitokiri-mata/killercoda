# Running a Debian Linux Image

The following pull command fetches the Debian official image from the Docker Hub and saves it to our system. 

Try: `docker pull debian:7`{{execute}}

**Note:**
- debian: The name of the Docker image that you want to run
- 7: The version/tag of the Docker image (The default is :latest)

More information about the Docker image is available at https://hub.docker.com/_/debian .


Run the Debian docker image:	<br/>
`docker run debian`{{execute}}

The container will stop immediately.

Show the running containers:
`docker ps`{{execute}}


Show all containers (including stopped one):<br/>
`docker ps -a`{{execute}}


You may append a command to execute when the container starts:

`docker run debian echo "hello"`{{execute}}

# Running docker container interactively

Connect container to terminal with -it option (which runs the docker container interactively):
`docker run -it debian`{{execute}}

In the docker container, type some commands, e.g.<br/>

`ls`{{execute}}

`whoami`{{execute}} 


# Installing FIGlet in docker containers

FIGlet is a simple command-line utility for creating ASCII text banners or large letters out of ordinary text,

Try to run figlet in our container.

`figlet hello`{{execute}}

The program is not installed in the image.

`apt` is a command-line utility for installing, updating, removing and managing deb packages on Ubuntu/Debian Linux. Let's install it using `apt` utility. 

First, updates the list of available packages and their versions.

`apt update `{{execute}}

After that, install the `figlet` program.

`apt install figlet `{{execute}}

Execute the following command again.

` figlet hello`{{execute}}

 Sample output:

 ```
 _          _ _       
| |__   ___| | | ___  
| '_ \ / _ \ | |/ _ \ 
| | | |  __/ | | (_) |
|_| |_|\___|_|_|\___/ 

```                  

Exit the docker container.

`exit`{{execute}}

Check the container status.

`docker ps -a`

Note that the two containers we executed before are now in the "Stopped" state.


# Docker Commit

Run the Debian docker image again:

`docker run debian`{{execute}}

Is the `figlet` program installed in the new container? Why?

Exit the docker container.

`exit`{{execute}}

If we need something installed in our container, we should build a custom Docker image. We can 
1) Can use  the `docker commit`  to commit a container's file changes or settings into a new image. 
2) Write a DockerFile to build a Docker image. 

In this exercise, we will adopt approach 1.

Execute in the terminal (replace [container ID] with the ID of the container with figlet installed):

`docker commit [Container ID]] debian-figlet`{{copy}}

Verify that a new image nanmed `debian-figlet` is created.

`docker image ls`{{execute}}

Execute the followng command to check if `figlet` is installed in the image.

`docker run debian-figlet figlet Hello PolyU`{{execute}}

Sample Output:

```
 _   _      _ _         ____       _       _   _ 
| | | | ___| | | ___   |  _ \ ___ | |_   _| | | |
| |_| |/ _ \ | |/ _ \  | |_) / _ \| | | | | | | |
|  _  |  __/ | | (_) | |  __/ (_) | | |_| | |_| |
|_| |_|\___|_|_|\___/  |_|   \___/|_|\__, |\___/ 
                                     |___/       
```






