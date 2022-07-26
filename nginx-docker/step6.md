# Customizing the Nginx website 

You should perform the following steps in terminal T2 (while the nginx server should be running in terminal T1). 

The default webpage at the root folder is located at `/usr/share/nginx/html/index.html` in the Nginx container. 
- You may execute `cat /usr/share/nginx/html` in the nginx container to show the HTML source of the default webpage. 
- You can also show the content of the file in the Docker host by executing the command `docker execute  [nginx's container ID] cat /usr/share/nginx/html/index.html`.

Execute the command:
`cat /usr/share/nginx/html/index.html` in the container `c0` to view the source code of the `index.html` file.

> `docker exec -it c0 cat /usr/share/nginx/html/index.html`{{execute T2}}

We will customize the webpage shown when Nginx web server is accessed.

# Create the customized webpage

First, create a webpage `index.html` in Docker host with the following content.

```
This is my first website
```

You can either use your favourite editor (e.g. nano, vi) or create the file using the following command.

> `echo 'This is my first website' > index.html`{{execute T2}}

# Copy files to/from Docker container

The `docker cp` commands can be used to copy files to/from the container. 
- To copy files from the Docker host to the container, execute `docker cp [source file] [container ID]:[destination path]`.
- E.g. To copy the customized `index.html` from the Docker host into the container, we may execute  `docker cp index.html [nginx container ID]:/usr/share/nginx/html`.

Execute the following command in terminal T2:

> `docker cp index.html c0:/usr/share/nginx/html`{{execute T2}}


Verify that the default webpage is updated. Execute:

> `curl localhost:20080`{{execute T2}}

Visit `http://localhost:20080` in your browser (if you are running the lab in your own computer).

In katacoda, you may visit the following URL to view the result.

https://[[HOST_SUBDOMAIN]]-20080-[[KATACODA_HOST]].environments.katacoda.com/ .

 
# Clean up the containers

Switch to Terminal 1, stop the Nginx server with Ctrl+C.

Use the following command to clean up all stopped containers.

> `docker container prune`{{execute T1}}

Click 'Y' to confirm.

