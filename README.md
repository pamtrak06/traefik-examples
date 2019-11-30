# traefik-jhipster-example

## Description

docker-compose example of traefik usage with a simple service and a jhipster application (jhipster registry)

## Configuration



```bash
# Identify subdomains in docker-compose.yml
export sudomains=$(cat docker-compose.yml|yq r docker-compose.yml services -j|jq '.[].networks|select(.!=null)'|jq '.[].aliases|select(.!=null)'|grep -v "\["|grep -v "\]"|tr -d '"'|grep "\S"|tr -d '\n')
#export sudomains=$(echo ${sudomains::-1})
echo "127.0.0.1 jhipster-portal ${sudomains}" >> /etc/hosts
```

- yq - yaml command line parser : https://mikefarah.github.io/yq/
- jq - json command line parser : https://stedolan.github.io/jq/

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

- http://portal/simple-service
- http://localhost:80  # simple-service

- http://portal/jhipster-registry
- http://localhost:8761 # jhipster-registry

