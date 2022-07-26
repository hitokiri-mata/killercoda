# Docker Volumes (II)

From the host machine,  modify the `index.html` as follows.
 
```
cat<<END >/var/lib/docker/volumes/web_folder/_data/index.html
<html>
	<body>
		Hello World!!!
	</body>
</html>
END
```

Verify that the website served by the Nginx container at localhost:8080 is updated.

> `curl localhost:8080`

**Question:** 
What is the output of the curl command?

<br/>
