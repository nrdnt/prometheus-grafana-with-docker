
A monitoring solution for Docker hosts and containers with Prometheus, Grafana, cAdvisor, NodeExporter and alerting with AlertManager.

 ## Install

### Create .env:
```
PROMETHEUS_PORT=9090
NODE_EXPORTER_PORT=9100
CADVISOR_PORT=8080
GRAFANA_PORT=3000
GF_SECURITY_ADMIN_USER=admin 
GF_SECURITY_ADMIN_PASSWORD=admin
```

### Clone this repository on your Docker host, cd into test directory and run compose up:

```
git clone https://github.com/nrdnt/prometheus-grafana-with-docker.git
cd prometheus-grafana-with-docker
docker compose up -d

## Prerequisites:

* Docker Engine >= 24.0.2
* Docker Compose >= v2.21.0

## Containers:

* Prometheus (metrics database) `http://<host-ip>:9090`
<!-- * AlertManager (alerts management) `http://<host-ip>:9093` -->
* Grafana (visualize metrics) `http://<host-ip>:3000`
* NodeExporter (host metrics collector)
* cAdvisor (containers metrics collector)