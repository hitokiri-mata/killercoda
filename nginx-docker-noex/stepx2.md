# Running a Debian Linux Image

The following pull command fetches the Debian official image from the Docker Hub and saves it to our system. 

Try: <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker pull debian:7 </span>

**Note:**
- debian: The name of the Docker image that you want to run
- 7: The version/tag of the Docker image (The default is :latest)

More information about the Docker image is available at https://hub.docker.com/_/debian .


Run the Debian docker image:	<br/>
> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run debian </span>

The container will stop immediately.

Show the running containers:
> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker ps </span>

Show all containers (including stopped one):
> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker ps -a </span>

You may append a command to execute when the container starts:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run debian echo "hello" </span>

# Running docker container interactively

Connect container to terminal with -it option (which runs the docker container interactively):
> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run -it debian </span>

In the docker container, type some commands, e.g.<br/>

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> ls </span>
> 
> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> whoami </span>


# Installing FIGlet in docker containers

FIGlet is a simple command-line utility for creating ASCII text banners or large letters out of ordinary text,

Try to run figlet in our container.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> figlet hello </span>

The program is not installed in the image.

`apt` is a command-line utility for installing, updating, removing and managing deb packages on Ubuntu/Debian Linux. Let's install it using `apt` utility. 

First, updates the list of available packages and their versions.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> apt update </span>

After that, install the `figlet` program.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> apt install figlet </span>

Execute the following command again.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> figlet hello </span>

 Sample output:

 ```
 _          _ _       
| |__   ___| | | ___  
| '_ \ / _ \ | |/ _ \ 
| | | |  __/ | | (_) |
|_| |_|\___|_|_|\___/ 

```                  

Exit the docker container.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> exit </span>

Check the container status.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker ps -a </span>

Note that the two containers we executed before are now in the "Stopped" state.


# Docker Commit

Run the Debian docker image again:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run debian </span>

Is the `figlet` program installed in the new container? Why?

Exit the docker container.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> exit </span>

If we need something installed in our container, we should build a custom Docker image. We can 
1) Can use  the `docker commit`  to commit a container's file changes or settings into a new image. 
2) Write a DockerFile to build a Docker image. 

In this exercise, we will adopt approach 1.

Execute in the terminal (replace [container ID] with the ID of the container with figlet installed):

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker commit [Container ID]] debian-figlet </span>

Verify that a new image nanmed `debian-figlet` is created.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker image ls </span>

Execute the followng command to check if `figlet` is installed in the image.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run debian-figlet figlet Hello PolyU </span>

Sample Output:

```
 _   _      _ _         ____       _       _   _ 
| | | | ___| | | ___   |  _ \ ___ | |_   _| | | |
| |_| |/ _ \ | |/ _ \  | |_) / _ \| | | | | | | |
|  _  |  __/ | | (_) | |  __/ (_) | | |_| | |_| |
|_| |_|\___|_|_|\___/  |_|   \___/|_|\__, |\___/ 
                                     |___/       
```

<br/>
