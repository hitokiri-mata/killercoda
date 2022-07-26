# Customizing the Nginx website 

You should perform the following steps in terminal T2 (while the nginx server should be running in terminal T1). 

The default webpage at the root folder is located at `/usr/share/nginx/html/index.html` in the Nginx container. 
- You may execute `cat /usr/share/nginx/html` in the nginx container to show the HTML source of the default webpage. 
- You can also show the content of the file in the Docker host by executing the command `docker execute  [nginx's container ID] cat /usr/share/nginx/html/index.html`.

Execute the command:

`cat /usr/share/nginx/html/index.html` in the container `c0` to view the source code of the `index.html` file.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker exec -it c0 cat /usr/share/nginx/html/index.html </span>

We will customize the webpage shown when Nginx web server is accessed.

# Create the customized webpage

First, create a webpage `index.html` in Docker host with the following content.

```
This is my first website
```

You can either use your favourite editor (e.g. nano, vi) or create the file using the following command.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> echo 'This is my first website' > index.html </span>

# Copy files to/from Docker container

The `docker cp` commands can be used to copy files to/from the container. 
- To copy files from the Docker host to the container, execute `docker cp [source file] [container ID]:[destination path]`.
- E.g. To copy the customized `index.html` from the Docker host into the container, we may execute  `docker cp index.html [nginx container ID]:/usr/share/nginx/html`.

Execute the following command in terminal T2:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker cp index.html c0:/usr/share/nginx/html </span>


Verify that the default webpage is updated. Execute:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> curl localhost:20080 </span>

Visit `http://localhost:20080` in your browser (if you are running the lab in your own computer).

In katacoda, you may visit the following URL to view the result.

https://[[HOST_SUBDOMAIN]]-20080-[[KATACODA_HOST]].environments.katacoda.com/ .

 
# Clean up the containers

Switch to Terminal 1, stop the Nginx server with Ctrl+C.

Use the following command to clean up all stopped containers.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker container prune </span>

Click 'Y' to confirm.

<br/>
