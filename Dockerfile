# Set base image.
FROM alpine:latest

MAINTAINER Michal Kurzeja <michal@accesto.com>

# Define rancher-compose version
ENV RANCHER_COMPOSE_VERSION=v0.12.5
ENV RANCHER_CLI_VERSION=v0.6.1

# Install dependencies and rancher-compose
RUN apk add --quiet --no-cache ca-certificates curl unzip && \
	curl -sSL "https://github.com/rancher/rancher-compose/releases/download/${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-${RANCHER_COMPOSE_VERSION}.tar.gz" | tar -xzp -C /usr/local/bin/ --strip-components=2 && \
	curl -sSL "https://releases.rancher.com/compose/${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-${RANCHER_COMPOSE_VERSION}.tar.gz" | tar -xzp -C /usr/local/bin/ --strip-components=2 && \
	curl -sSL "https://releases.rancher.com/cli/${RANCHER_CLI_VERSION}/rancher-linux-amd64-${RANCHER_CLI_VERSION}.tar.gz" | tar -xzp -C /usr/local/bin/ --strip-components=2 && \
	rm -rf /var/cache/*

# Set working directory
WORKDIR /workspace

# Executing defaults
CMD ["/bin/sh"]
