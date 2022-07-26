# Comparing docker images

Execute the following command to pull the `python:latest` docker image:

> `docker pull python:latest`

Execute the following command to check the Python version in the container.

> `docker run python:latest python --version`

What is the Python version?

Execute a Python statement with the Python Command-line tool:

> `docker run python:latest python -c "print(1+3*5)"`

Also, pull the following docker images for python 3.9.6
- python:slim
- python:alpine


View the size of the pulled Python Docker images.

> `docker image ls python*`

Which image has the smallest size?


Visit https://hub.docker.com/_/python to understand the difference between the images.

You can also visit https://github.com/docker-library/python to get the Dockerfiles for the images.

<br/>
