# Running FIGlet in the Ubuntu docker container

FIGlet is a simple command-line utility for creating ASCII text banners or large letters out of ordinary text.

Execute figlet in our Ubuntu container.

> `figlet hello`{{execute}}

It will generate an error as the program is not installed in the Ubuntu docker image.


`apt` is a command-line utility for installing, updating, removing and managing deb packages on Ubuntu/Debian Linux. Let's install it using `apt` utility. 

First, updates the list of available packages and their versions.

> `apt update `{{execute}}

After that, install the `figlet` program.

> `apt install figlet `{{execute}}

Execute the following command again.

> ` figlet hello`{{execute}}

 Sample output:

 ```
 _          _ _       
| |__   ___| | | ___  
| '_ \ / _ \ | |/ _ \ 
| | | |  __/ | | (_) |
|_| |_|\___|_|_|\___/ 

```                  

Check the container status by executing:

> `docker ps -a`{{execute}}

What is the status of the two containers that we have executed?


