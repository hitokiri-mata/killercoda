# Comparing docker images

Execute the following command to pull the `python:latest` docker image:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker pull python:latest </span>

Execute the following command to check the Python version in the container.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run python:latest python --version </span>

What is the Python version?

Execute a Python statement with the Python Command-line tool:

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker run python:latest python -c "print(1+3*5)" </span>

Also, pull the following docker images for python 3.9.6
- python:slim
- python:alpine


View the size of the pulled Python Docker images.

> <span align="left" style="color:#FFF;background:#555;font:Courier New; font-size: 90%; padding-left: 5px; padding-right: 5px; padding-top: 5px; padding-bottom: 5px;"> docker image ls python* </span>

Which image has the smallest size?


Visit https://hub.docker.com/_/python to understand the difference between the images.

You can also visit https://github.com/docker-library/python to get the Dockerfiles for the images.

<br/>
