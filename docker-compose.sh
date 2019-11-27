#!/bin/bash

if [  -z "$(docker network ls|grep net-traefik)" ]; then
  docker network create net-traefik 
fi
docker-compose $@
sleep 5
docker exec grafana mkdir -p /etc/grafana/provisioning/dashboards
docker exec grafana mkdir -p /etc/grafana/provisioning/datasources
docker cp grafana/dashboard.yml grafana:/etc/grafana/provisioning/dashboards/
docker cp grafana/datasource.yml grafana:/etc/grafana/provisioning/datasources/
docker restart grafana
