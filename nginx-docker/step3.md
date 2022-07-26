# Connect to Nginx web server (Terminal T2)

Open another terminal in the host (T2). Execute:

> `docker ps`{{execute T2}}

Check that the nginx container is running. 
Under the `port` column, `80/tcp` will be shown. 
This indicates the Nginx container is exposing the 80 (the Nginx will listen for incoming connection at port `80`).

Execute the following command to show the container ID of the latest created container:

> `docker ps -lq`{{execute T2}}

You may execute the command `docker ps -h`{{execute T2}} to know more about the options `-l` and `-q` for `docker ps`.
- the `-l` option will show the latest created container 
- the `-q` option will just return the container ID

You may launch a Bash shell to the running Nginx container and access the web server by the command:  `docker exec -it [your Nginx container ID ] bash`

You can execute the following command, where `$(docker ps -lq) ` will substitute the container ID of the latest created container.

> `docker exec -it $(docker ps -lq) bash`{{execute T2}}

Inside the nginx container, execute the following command to connect to localhost at port 80 using the `curl` command (The port 80 is the default port for web servers and is optional.).

> `curl localhost:80`{{execute T2}}


Sample output:

```
root@9c72cc270764:/# curl localhost:80
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

Type `exit` to exit the nginx container.

> `exit`{{execute T2}}

Switch to terminal `T1`.  Stop the Nginx web server with `Ctrl+C`.