#!/bin/bash

if [  -z "$(docker network ls|grep net-traefik)" ]; then
  docker network create net-traefik 
fi
docker-compose $@
