.PHONY: all
all: help

## Help
help: ## Display help
	@echo ''
	@echo 'Usage:'
	@echo '  make <target>'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} { \
		if (/^[a - zA - Z_ - ]+:.*?##.*$$/) {printf "    % - 20s%s\n", $$1, $$2} \
		else if (/^## .*$$/) {printf "  %s\n", substr($$1,4)} \
		}' $(MAKEFILE_LIST)

remove-all: ## 
	docker compose down --volumes --remove-orphans --rmi all
	docker system prune --volumes --all -f

build-all: ##
	cd prometheus; docker build -f Dockerfile -t prometheus-img:latest .
	cd node-exporter; docker build -f Dockerfile -t node-exporter-img:latest .
	cd cadvisor; docker build -f Dockerfile -t cadvisor-img:latest .
	cd grafana; docker build -f Dockerfile -t grafana-img:latest .
# cd gateway; docker build -f Dockerfile -t gateway-img:latest .

deploy-all: ## 
	docker compose up -d node-exporter-svc
	docker compose up -d cadvisor-svc
	docker compose up -d prometheus-svc
	docker compose up -d grafana-svc
# docker compose -p dc up -d gateway-svc

