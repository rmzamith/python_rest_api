# Dockerized Python Flask REST API
This projec is an example on how to implement a simple microservice app for backend purposes

## Requirements
- Make
- [Docker](https://docs.docker.com/get-docker/)

## Running the application

Simple open a terminal, `cd` into the root folder of the project and run:
```
$ make up
```

This should spin up a docker container running the microservice and expose it on port 8002.

## Using the application
Documentation of the REST endpoints can be found at the swagger-ui interface, after the Docker container is up at [http://localhost:8002/api/v1/ui]
