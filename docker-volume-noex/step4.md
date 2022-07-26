
# Sharing files between containers using bind mount

Bind mount allows you to share folder/files between multiple containers.

Launch another container from the Alpine Linux image and use the `-v` option to bind `/tmp/data` in the host. Execute:

> `docker run --name c3 -v /tmp/data:/data alpine ls -l /data`

<br/>

> `docker run --name c4  -v /tmp/data:/data alpine  cat /data/ping.txt`

You will also find the file `hello.txt` under `/data` inside the containers.

<br/>
