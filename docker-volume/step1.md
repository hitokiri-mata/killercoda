# Data persistency in docker containers

First,  run an interactive `sh` shell within an Alpine Linux container named c1. Execute:

> `docker run --name c1 -it alpine sh`{{execute}}

Inside the container, we will create a file `hello.txt` in the folder. Execute:

> `echo "Hello World!"> hello.txt`{{execute}}

Check that the file `hello.txt` is created. Execute:

> `ls -l`{{execute}}

You may show the content of the file using the `cat` command. Execute:

> `cat hello.txt`{{execute}}

Exit the container. Execute:

> `exit`{{execute}}


Now, check the state of the `c1 container`.  Execute:

> `docker ps -a`{{execute}}

The container has been stopped but the container's filesystem still exists in the host.

We will now check how the read-write layers in the container can be accessed from the host. To get the location of the container's layers, we can use the `inspect` command and scroll the output until you find the **GraphDriver** attribute.

> `docker container inspect c1 `{{execute}}

Alternatively, we can also use the Go template notation and to get the content of the **GraphDriver** keys right away.

> `apt install jq`{{execute}}
> 
> `docker container inspect -f "{{json .GraphDriver}}" c1 | jq`{{execute}}


You should get an output similar to the following  (you will get different ID for the directory paths)

```
{
  "Data": {
    "LowerDir": "/var/lib/docker/overlay/0cf0fd12b6cde24f6220ad882bebe977f909a80efdfa96c5945d9873cd41985e/root",
    "MergedDir": "/var/lib/docker/overlay/22b1ce8fe07de4c711da8073e2d0b85e7389d5cd4fc2ba829fe3a131447e8361/merged",
    "UpperDir": "/var/lib/docker/overlay/22b1ce8fe07de4c711da8073e2d0b85e7389d5cd4fc2ba829fe3a131447e8361/upper",
    "WorkDir": "/var/lib/docker/overlay/22b1ce8fe07de4c711da8073e2d0b85e7389d5cd4fc2ba829fe3a131447e8361/work"
  },
  "Name": "overlay"
}
```

Docker makes use of overlay filesystem to let you mount a filesystem using two directories.
* The **lower** directory of the filesystem is read-only
* The **upper** directory of the filesystem  can support read and write.

When a process reads a file, the overlayfs filesystem driver will look in the upper directory and reads the file from there if it’s present. Otherwise, it looks in the lower directory. When a process writes a file, overlayfs will just write it to the upper directory.

Inside our docker host,  we can inspect the folder path  specified in **LowerDir** and **UpperDir**. 

`ls [The path specified in the LowerDir attribute]`

`ls [The path specified in the UpperDir attribute]`

Can you  find our `hello.txt` in the directories?
