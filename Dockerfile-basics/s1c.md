# Running the docker image


Run the docker image by executing

> `docker run myimage`{{execute}}

If a command is provided after the image name, the specified command will be executed instead.

What will be the output of the following command?

> * `docker run myimage figlet docker is fun`{{execute}}

> * `docker run myimage ls -l`{{execute}}


You can also launch an interactive bash shell to the created container.  Execute:

 > `docker run -it myimage bash`{{execute}}

Execute the following command to quit the shell.

>  `exit`{{execute }} 

