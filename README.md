# docker

Docker commands
~~~~~~~~~~~~~~~~~~~~~~~~
````
docker -v                                | version of Docker Engine
docker ps                                | list of running containers
docker ps -a                             | list of all containers
docker images                            | list of local Images

docker search nginx                     | find Image nginx in DockerHub without using the official site (nginx just for example)
docker pull nginx                       | download Image nginx from DockerHub (nginx just for example)

docker run -it -p 8444:80 nginx         | start the container interactively, from port 8444 with the name nginx (port and service nginx just for example here)
docker run -d -p 8444:80 nginx          | starting the container NOT interactively, from port 8444 with the name nginx (port and service nginx just for example here)

docker kill #CONTAINER                                                | kill the container
docker rm #CONTAINER                                                  | removing the container
docker rmi nginx --force                                              | removing Image nginx (nginx just for example)
docker rmi $(docker images --filter "dangling=true" -q) --force       | deleting Image named <none>
````


Dockerfile example
~~~~~~~~~~~~~~~~~~~~~~~~
````
FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y install apache2
RUN echo 'Hello world from DockerHub!' > /var/www/html/index.html
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
EXPOSE 80
````


Working with Dockerfile
~~~~~~~~~~~~~~~~~~~~~~~~
````
docker build -t LOGIN/ryben:v1 .         | running the created Dockerfile with the name ryben and subfile v1
docker run -d -p 8446:80 ryben:v1        | запуск для перевірки через порт 8446

docker tag ryben:v1 ryben:copy            | creating a copy via Tag

docker exec -it #CONTAINERID /bin/bash   | login to the created mini container
exit                                     | exit from the mini virtual machine

docker commit #CONTAINERID ryben:v2      | upgrade version 1 to version 2
docker run -d -p 8448:80 ryben:v2        | run to test via port 8448
````

Push on dockethub.com
~~~~~~~~~~~~~~~~~~~~~~~~
````
sudo docker login
sudo docker push
````

Compose in Dockerfile
~~~~~~~~~~~~~~~~~~~~~~~~
````
version: '3.1'
services:
  db:
    image: mariadb
    restart: always
    environment:
      MARIADB_ROOT_PASSWORD: 12345
  adminer:
    image: adminer
    restart: always
    ports:
      - 8446:8080
````
enter localhost:8446 -> login: root / pass: 12345
docker compose up -d              | starting the container
docker ps
docker compose down               | stopping the container
