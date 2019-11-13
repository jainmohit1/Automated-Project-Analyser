## Webapp direcotry contains docker configuration files, apache2 vhost and logs.

## Directory Information

### Configuration
 - apache2
  - This directory contains virtual hosts for the app.

### logs
 - All the logs are saved into this directory.

## How to use
### Build Docker Image
 - docker build -t csc510 .
 - docker images
 - docker tag <id> abprk/csc510:latest
 - docker push abprk/csc510:latest

### Docker Operations
 - docker images
 - docker container ls
 - docker container ls -a
 - docker-compose down
 - docker-compose up -d
 - docker exec -it webapp_api_1 bin/bash

### Remove/Prune docker images/containers
 - docker system prune
 - docker container stop <id>
 - docker container prune
 - docker image prune -a
 - docker container rm <id>
 - docker rm <id>
 - docker rmi <id>

### Docroot
 - There is a directory called docroot in the repo, the main business logic resides in that directory.
