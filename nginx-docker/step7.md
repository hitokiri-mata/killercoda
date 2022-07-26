<h1>Exercise: Running three instances of nginx web server</h1>

Complete the following exercises in Terminal T1.

Start three instances of nginx docker containers. 

![nginx instances](./assets/nginx.jpg)

Use the -d option runs the container in detached mode (the server will run in background). Execute:

> `docker run -d -p 20080:80 --name ws1 nginx`{{execute}}

> `docker run -d -p 20081:80 --name ws2 nginx`{{execute}}


Check that there are TWO running Nginx containers. Execute:

> `docker container ls`{{execute}}

> `docker exec ws1 /bin/bash -c "echo 'This is server 1' > /usr/share/nginx/html/index.html"`{{execute}}

> `docker exec ws2 /bin/bash -c "echo 'This is server 2' > /usr/share/nginx/html/index.html"`{{execute}}

Similarly, create the third web instance of the webserver  which outputs "This is server 3". Map the container port "80" to host port "20082".

Access the three instances of webservers at
```http://localhost:20080/, http://localhost:20081/, http://localhost:20082/```.

https://[[HOST_SUBDOMAIN]]-20080-[[KATACODA_HOST]].environments.katacoda.com/

https://[[HOST_SUBDOMAIN]]-20081-[[KATACODA_HOST]].environments.katacoda.com/

https://[[HOST_SUBDOMAIN]]-20082-[[KATACODA_HOST]].environments.katacoda.com/

Execute the following command and input your student ID and name.

> `input_name`{{execute}}


Click **Continue** below to check your script for correctness.


