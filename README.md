# GENERAL COMMANDS

~~~~~~~~~~~~~~~~~~~~~~~~
Start the docker daemon
docker -d

Get help with Docker. Can also use –help on all subcommands
docker --help

Display system-wide information
docker info
~~~~~~~~~~~~~~~~~~~~~~~~

## Run a new Container

> [!NOTE]
> Docker images are a lightweight, standalone, executable package
of software that includes everything needed to run an application:
code, runtime, system tools, system libraries and settings.

~~~~~~~~~~~~~~~~~~~~~~~~
Start a new Container from an Image
docker run IMAGE
docker run nginx

...and assign it a name
docker run ——name CONTAINER IMAGE
docker run --name web nginx

...and map a port
docker run -p HOSTPORT:CONTAINERPORT IMAGE
docker run -p 8080:80 nginx

...and map all ports
docker run -P IMAGE
docker run -P nginx

...and start container in background
docker run -d IMAGE
docker run -d nginx

...and assign it a hostname
docker run --hostname HOSTNAME IMAGE
docker run --hostname srv nginx

...and add a dns entry
docker run --add-host HOSTNAME: IP IMAGE

...and map a local directory into the container
docker run -v HOSTDIR: TARGETDIR IMAGE
docker run -v ~/:/usr/share/nginx/html nginx

...but change the entrypoint
docker run -it --entrypoint EXECUTABLE IMAGE
docker run -it --entrypoint bash nginx
~~~~~~~~~~~~~~~~~~~~~~~~

## Manage Containers

> [!NOTE]
> A container is a runtime instance of a docker image. A container
will always run the same, regardless of the infrastructure.
Containers isolate software from its environment and ensure
that it works uniformly despite differences for instance between
development and staging.

~~~~~~~~~~~~~~~~~~~~~~~~
Show a list of running containers
docker ps

Show a list of all containers
docker ps -a

Delete a container
docker rm CONTAINER
docker rm web

Delete a running container
docker rm -f CONTAINER
docker rm -f web

Delete stopped containers
docker container prune

Stop a running container
docker stop CONTAINER
docker stop web

Start a stopped container
docker start CONTAINER
docker start web

Copy a file from a container to the host
docker cp CONTAINER:SOURCE TARGET
docker cp web:/index.html index.html

Copy a file from the host to a container
docker cp TARGET CONTAINER:SOURCE
docker cp index.html web:/index.html

Start a shell inside a running container
docker exec -it CONTAINER EXECUTABLE
docker exec -it web bash

Rename a container
docker rename OLD_NAME NEW_NAME
docker rename 096 web

Create an image out of container
docker commit CONTAINER
docker commit web
~~~~~~~~~~~~~~~~~~~~~~~~

## Manage Images

~~~~~~~~~~~~~~~~~~~~~~~~
Download an image
docker pull IMAGE [: TAG]
docker pull nginx

Upload an image to a repository
docker push IMAGE
docker push myimage:1.0

Delete an image
docker rmi IMAGE

Show a list of all Images
docker images

Delete dangling images
docker image prune

Delete all unused images
docker image prune -a

Build an image from a Dockerfile
docker build DIRECTORY
docker build .

Tag an image
docker tag IMAGE NEWIMAGE
docker tag ubuntu ubuntu: 18.04

Build and tag an image from a Dockerfile
docker build -t IMAGE DIRECTORY
docker build -t myimage .

Save an image to tar file
docker save IMAGE › FILE
docker save nginx › nginx. tar

Load an image from a tar file
docker load -i TARFILE
docker load -i nginx.tar
~~~~~~~~~~~~~~~~~~~~~~~~

## Info & Stats

~~~~~~~~~~~~~~~~~~~~~~~~
Show the logs of a container
docker logs CONTAINER
docker logs web

Show stats of running containers
docker stats

Show processes of container
docker top CONTAINER
docker top web

Show installed docker version
docker version

Get detailed info about an object
docker inspect NAME
docker inspect nginx

Show all modified files in container
docker diff CONTAINER
docker diff web

Show mapped ports of a container
docker port CONTAINER
docker port web
~~~~~~~~~~~~~~~~~~~~~~~~

## DOCKER HUB

> [!NOTE]
> Docker Hub is a service provided by Docker for finding and sharing
container images with your team. Learn more and find images
at https://hub.docker.com

~~~~~~~~~~~~~~~~~~~~~~~~
Login into Docker
docker login -u <username>

Publish an image to Docker Hub
docker push <username>/<image_name>

Search Hub for an image
docker search <image_name>

Pull an image from a Docker Hub
docker pull <image_name>
~~~~~~~~~~~~~~~~~~~~~~~~
