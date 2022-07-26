# Connect to Nginx web server outside the Nginx container

To connect to the web server from the host (outside the container), we need to know the IP address of the container.

Execute the following command to obtain the IP address of the Nginx container.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker inspect $(docker ps -lq) --format="{{json .NetworkSettings.Networks.bridge.IPAddress}}" </span>

You can then connect to the nginx container's IP address using the `curl command.

You can then connect to the web server using the IP address.

`curl [nginx container's IP]`.



# Further Exploration

You can use the following command to inspect the details about Nginx image and containers.
`docker inspect nginx`

In the JSON output, search for the attribute "ContainerConfig.ExposedPorts" to examine the exposed port of the Nginx image.

Sample output:

```
[
    {
        "Id": "sha256:08b152afcfae220e9709f00767054b824361c742ea03a9fe936271ba520a0a4b",
        "RepoTags": [
            "nginx:1.21",
            "nginx:latest"
        ],
        
        ...
        "ContainerConfig": {
            "Hostname": "2997e2321de2",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "80/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "NGINX_VERSION=1.21.1
        
        ...
    }
]
```

You can also directly pikc out the relevant attribute in the JSON using the Go template (Ref: https://docs.docker.com/engine/reference/commandline/inspect/).

Execute:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker inspect nginx:1.21 --format="{{json .ContainerConfig.ExposedPorts}}"  |jq |jq </span>

To get the IP address of the running container, execute `docker inspect [Your container ID]`.

Alternatively, you can execute the following command (`docker ps -lq` will return the ).

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker inspect $(docker ps -lq) </span>

Execute the command `docker ps -h` to understand the options -l and -q.
- the -l option will return the latest created container 
- the -q option  will just return the container ID.


docker inspect $(docker ps -lq) --format="{{json .NetworkSettings.Networks.bridge.IPAddress}}"




# Examining the Nginx configuration files 

To view the Nginx configuration file, we can execute the following command in the Nginx container:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> cat /etc/nginx/nginx.conf </span>


In the host machine, execute the following command to view the configuration file `nginx.conf` in the container.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run nginx cat /etc/nginx/nginx.conf </span>

Sample output (commented lines are removed for clarity): 

```
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
   include       /etc/nginx/mime.types;
   default_type  application/octet-stream;

	...

   access_log  /var/log/nginx/access.log  main;

   sendfile        on;
   keepalive_timeout  65;
   include /etc/nginx/conf.d/*.conf;
}
```

In the above example, the default `http` block has included all the `.conf` files under `/etc/nginx/conf.d/`.

Execute the following command to list the configuration files under `/etc/nginx/conf.d/`.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run nginx ls /etc/nginx/conf.d/default.conf </span>

View the content of `/etc/nginx/conf.d/default.conf`.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run nginx cat /etc/nginx/conf.d/default.conf </span>

Sample output (commented lines are removed for clarity):

```
server {
    listen 80;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

```

With the default configuration,
- `listen 80`: the server will listen for network traffic sent to the target port `80`.
- `root /usr/share/nginx/html;`: specify the location of the default HTML page shown when visiting the `/ location of the webserver.

**Exercise:**

Execute `cat /usr/share/nginx/html` in the nginx container to show the HTML source of the default webpage.


# Stopping and removing the running containers

Check the container ID of the various containers:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker ps -a </span>

To stop and remove the running containers:

```
docker container rm -f [container ID's prefix]
```

<br/>
