# Bind Mount

Bind mount allows you to mount a file or directory on the host machine into a container. The file or directory does not need to exist on the Docker host already. It is created on demand if it does not yet exist. 
**Bind-mounting** is  useful in development as it allows us to share source code on the host with the container easily.

The `ping` command can be used to check the network connectivity to a remote server. Let's create a container from the busybox image which will continually ping the Google's DNS Server (IP: 8.8.8.8) and write the result into a file. Execute:

> `docker container run --name c2 -d -v /tmp/data:/data busybox:latest sh -c 'ping 8.8.8.8 > /data/ping.txt'`{{execute}}

About the docker run options:
* **busybox:latest**: We will run the docker image busybox with the tag `latest`.
* **-d**: container will run in the background
* **-v /tmp/data:/data** :  mount the `/tmp/data` in the host into the `/data` path in the 
container.
* **sh -c 'ping 8.8.8.8 > /data/ping.txt'**: Run the command 'ping 8.8.8.8 > /data/ping.txt' in the `sh` shell in the container. The result of the `ping` command will be redirected to the file `/data/ping.txt`.

Check the status of the container, execute:

> `docker ps -a`{{execute}}


We can run a command in a running container by using the `docker exec` command. To launch an interactive bash shell (using the `-it` option) into the container c2, execute:

> `docker exec -it c2 sh`{{execute}}

Check the running processes and locate the process with Process ID (PID) 1 within the container. Execute:

> `ps`{{execute}}.

The container will keep running as the run command will continuously ping 8.8.8.8 (and so the PID 1 process remains active). 


TO check the output of the ping command inside the container, execute:

>  * `ls -l /data`{{execute}}
>
>  * `cat /data/ping.txt`{{execute}}

You will get output similar to the following.

```
$ cat /data/ping.txt
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: seq=0 ttl=58 time=5.303 ms
64 bytes from 8.8.8.8: seq=1 ttl=58 time=5.289 ms
64 bytes from 8.8.8.8: seq=2 ttl=58 time=5.280 ms
64 bytes from 8.8.8.8: seq=3 ttl=58 time=5.268 ms
.......

```

Exit the container. Execute:

> `exit`{{execute}}

Since we have bind-mounted the host's folder into the container folder, you should be able to find `ping.txt` in the host's filesystem.
In the host machine, locate the file `ping.txt` under `/tmp/data`. Execute

> * `ls -l /tmp/data`{{execute}}
>
> * `cat /tmp/data/ping.txt`{{execute}}


You can inspect the details about the mounted paths for a container by examining the **Mounts** attribute in the `docker container inspect` command. Execute

> `docker container inspect -f "{{json .Mounts}}" c2 | jq`{{execute}}

You will get output similar to the following.

```
[
  {
    "Type": "bind",
    "Source": "/tmp/data",
    "Destination": "/data",
    "Mode": "",
    "RW": true,
    "Propagation": "rprivate"
  }
]
```

