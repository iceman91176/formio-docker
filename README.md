# FormIO docker
Build a simple docker iamge for the form.io API-Server and web-application

## Why
The official docker-image (or image-run-process) is a little bit weird in my opinion, so i put that together. It currently pulls the latest release of formio and formio-web-app and builds the container. I also added a small fix for auto-detecting the application-url. Plus: application is not runnind as root.

## How to build
```sh
make docker_build docker_tag docker_push DOCKER_REPO=your.repo.org
```

### Configure build
You can pass several parameters to the build process

* DOCKER_CMD = the docker command, default is docker
* DOCKER_ORG = will prefix the image, default is witcom
* DOCKER_REPO = will prefix the image in the docker_tag target
* DOCKER_IMAGE = name of the docker-image, default is formio-server

Skip the target you don't want, e.g. docker_tag & docker_push

## How to run
It uses the same ENV-Variables like the official form.io.

| *Variable* | *Description* |
| --- | --- |
| `NODE_CONFIG` | The configuration which is usually provided as file, can pe passed as JSON-String. Example NODE_CONFIG='{"mongo": "mongodb://mongo:27017/formio"}' |
| `ROOT_EMAIL` | eMail-Adress for "root"-admin user |
| `ROOT_PASSWORD` | Password for "root"-admin user  |
| `DEBUG` | Debug level, e.g. formio:*. Default is empty |

```sh
 docker run -p 3001:3001 \ 
 -e NODE_CONFIG='{"mongo": "mongodb://my-mongo-instance:27017/formio"}' \
 -e ROOT_EMAIL=admin@example.com \ 
 -e ROOT_PASSWORD=changeit \ 
 -e DEBUG=formio:* \ 
 witcom/formio-server:latest
```

