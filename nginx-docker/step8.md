# Viewing the nginx container log

The Nginx servers will output the access log to the standard output by default. However, your three Nginx servers are running in background (using the `-d` option). You cannot view the access log directly from the standard output of your terminal.

Instead, check the Nginx servers' log by using the command `docker logs [container ID]` to 
view the container log. For instance, to check the 

For instance, to check the log of the container named "ws1".

> `docker logs ws1`{{execute T1}}

**Exercise:**  

Check the container log of the other two containers by using their container name or container IDs.




