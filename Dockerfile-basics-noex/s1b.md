# Building the docker image

Build the docker image by executing

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker build . -t myimage </span>

* `-t` specifes the name of the target image

* `.` tells Docker to use the current directory as the build context

Sample output from the Docker daemon:

```
Sending build context to Docker daemon  1.547MB
Step 1/4 : FROM ubuntu:latest
 ---> d70eaf7277ea
Step 2/4 : RUN apt update
 ---> Running in eb1c6e85681f

Get:1 http://archive.ubuntu.com/ubuntu focal InRelease [265 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]

....

Fetched 18.7 MB in 2s (10.5 MB/s)
Reading package lists...
Building dependency tree...
Reading state information...
30 packages can be upgraded. Run 'apt list --upgradable' to see them.
Removing intermediate container eb1c6e85681f
 ---> 8976dbf199e8
Step 3/4 : RUN apt install figlet
 ---> Running in db785434e794

Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  figlet
0 upgraded, 1 newly installed, 0 to remove and 30 not upgraded.
Need to get 133 kB of archives.
After this operation, 752 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/universe amd64 figlet amd64 2.2.5-3 [133 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 133 kB in 0s (922 kB/s)
Selecting previously unselected package figlet.
(Reading database ... 4121 files and directories currently installed.)
Preparing to unpack .../figlet_2.2.5-3_amd64.deb ...
Unpacking figlet (2.2.5-3) ...
Setting up figlet (2.2.5-3) ...
update-alternatives: using /usr/bin/figlet-figlet to provide /usr/bin/figlet (figlet) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man6/figlet.6.gz because associated file /usr/share/man/man6/figlet-figlet.6.gz (of link group figlet) doesn't exist
Removing intermediate container db785434e794
 ---> 17ba4e98f621
Step 4/4 : CMD ["figlet", "Hello"]
 ---> Running in 9ecbe21955e2
Removing intermediate container 9ecbe21955e2
 ---> e0a7f0e76539
Successfully built e0a7f0e76539
Successfully tagged myimage:latest
```


A Docker image is built up from a series of layers. Each layer represents an instruction in the image's Dockerfile. From the above output, the Docker daemon will execute the different steps in the Dockerfile and create intermediate container images, some of which will become layers in your final container image. I



Check that the image is created. Execute:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker image ls </span>

<br/>
