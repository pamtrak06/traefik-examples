# traefik-jhipster-example

## Description

docker-compose example of traefik usage with a simple service and a jhipster application (jhipster registry)

## Configuration

```bash
# Install yam and json command line utilities
- yq - yaml command line parser : https://mikefarah.github.io/yq/
- jq - json command line parser : https://stedolan.github.io/jq/
# Identify subdomains in docker-compose.yml
export subdomains=$(cat docker-compose.yml|yq r docker-compose.yml services -j|jq '.[].networks|select(.!=null)'|jq '.[].aliases|select(.!=null)'|grep -v "\["|grep -v "\]"|tr -d '"'|grep "\S"|tr -d '\n')
#export subdomains=$(echo ${sudomains::-1})
echo "127.0.0.1 jhipster-portal ${subdomains}" >> /etc/hosts
```

## Launch

```bash
alias dcs="./docker-compose.sh"
dcs up -d
```

## Monitoring

```bash
dcs logs -f traefik
dcs logs -f simple-service
dcs logs -f jhipster-registry
```

Traefik:
- http://jhipster-portal:8080/dashboard/
- http://jhipster-portal:8080/api/rawdata

- http://localhost:3000 # grafana

## Check app

- http://jhipster-portal/simple-service
- http://localhost:80  # simple-service

- http://jhipster-portal
- http://localhost:8761 # jhipster-registry

