# traefik-jhipster-example

## Description

docker-compose examples of traefik configuration and usage:
- [simple-service]: simple http service
- [https]: simple https service
- [jhipster]: routing wih jhipster microservice stack
- [monitoring/influxdb]: monitoring traefik with influxdb/chronograf/telegraf/grafana

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
dcs logs -f
```

Traefik:
- http://jhipster-portal:8080/dashboard/
- http://jhipster-portal:8080/api/rawdata

