# GENERAL COMMANDS

~~~~~~~~~~~~~~~~~~~~~~~~
Start the docker daemon
docker -d

Get help with Docker. Can also use –help on all subcommands
docker --help

Display system-wide information
docker info
~~~~~~~~~~~~~~~~~~~~~~~~

## IMAGES

> [!NOTE]
> Docker images are a lightweight, standalone, executable package
of software that includes everything needed to run an application:
code, runtime, system tools, system libraries and settings.

~~~~~~~~~~~~~~~~~~~~~~~~
Build an Image from a Dockerfile
docker build -t <image_name>

Build an Image from a Dockerfile without the cache
docker build -t <image_name> . –no-cache

List local images
docker images

Delete an Image
docker rmi <image_name>

Remove all unused images
docker image prune
~~~~~~~~~~~~~~~~~~~~~~~~
