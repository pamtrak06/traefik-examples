# traefik-jhipster-example

## Description

docker-compose example of traefik usage with a simple service and a jhipster application (jhipster registry)

## Configuration

```bash
echo "127.0.0.1 portal" >> /etc/hosts
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
- http://portal:8080/dashboard/
- http://portal:8080/api/rawdata

- http://localhost:3000 # grafana

## Check app

- http://portal/simple-service
- http://localhost:80  # simple-service

- http://portal/jhipster-registry
- http://localhost:8761 # jhipster-registry

