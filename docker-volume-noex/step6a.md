
# Docker Volumes (I)

Bind mounts have limited functionality compared to Docker volumes. When you use a volume, a new directory is created within Docker’s storage directory on the host machine and Docker will manage that directory’s contents.

First, check  the commands available in the Docker volume API. Execute

> `docker volume --help`


We will start with the create command, and create a volume named **web_folder**.

> `docker volume create web_folder`

Check that the volume is created.

> `docker volume ls`


Sample output:

```
DRIVER              VOLUME NAME
local               web_folder
```

Inspect the details about the created Docker volume.

> `docker volume inspect web_folder`

```
[
    {
        "CreatedAt": "2021-08-08T09:33:31Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/web_folder/_data",
        "Name": "web_folder",
        "Options": {},
        "Scope": "local"
    }
]
```

The **Mountpoint** attributes shows the path on the Docker host where the volume can be accessed. We can now use this volume and mount it on a specific path of a container. 

List the files in the container's mountpoint. 

> `ls /var/lib/docker/volumes/web_folder/_data`

Currently, the folder should be empty.

Nginx  is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. We will run an Nginx image and mount the **web_folder** volume from the host onto **/usr/share/nginx/html** folder within the container. 
The folder `/usr/share/nginx/html` is the default folder served by the nginx container.

> `docker container run --name www -d -p 8080:80 -v web_folder:/usr/share/nginx/html nginx`

We have used the -p option to map the nginx default port (80) in the container to a port on the host (8080). We can verify that the nginx web server at `localhost:8080` by executing the following command:

> `curl localhost:8080`


Sample output:

```
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

From the host,  let's have a look at the content of the volume by listing 
the files in the container's mountpoint again.

> `ls /var/lib/docker/volumes/web_folder/_data`

**Question:** 
What file(s) is/are stored in the folder?

<br/>
