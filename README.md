# (Almost) Production-ready PostgreSQL High Availability Docker Swarm cluster

This repository contains an almost production ready Docker Swarm PostgreSQL Patroni cluster routed via HAProxy.

This project is based on:
- [Docker Swarm](https://docs.docker.com/engine/swarm/)
- [Patroni](https://github.com/patroni/patroni)
- [PostgreSQL](https://www.postgresql.org/)
- [HAProxy](https://www.haproxy.org/)

## Getting started

This guide is going to be running the cluster on 3 virtualized machines running [Alpine Linux](https://alpinelinux.org/) using [Virtual Machine Manager (Virt-Manager)](https://virt-manager.org/).

## Pre-requisites

3 Virtual machines in a [Docker Swarm](https://docs.docker.com/engine/swarm/) cluster running [Alpine Linux](https://alpinelinux.org/) on [Virt-Manager](https://virt-manager.org/) or 3 physical machines with a docker network connecting them. At least one manager node, and at least two worker nodes.

You should position PostgreSQL 1, ETCD(if only running 1), HAProxy and the Registry on the Manager node. You can position the other cluster members (PostgreSQL 2 and 3) on the worker nodes.

Note: To make this fully production ready you should use multiple ETCD instances as noted in the postgres config files in this repository.

## Building the Patroni image

Note: You can instead of building the image yourself and pushing it to a local registry use the docker hub registry service.

```bash
# Build the image:
docker build -t <node_ip_running_registry>:5000/patroni:<version> patroni
# Tag the image version.
docker tag patroni:<version> <node_ip_running_registry>:5000/patroni:<version>
# Push the image to the registry.
docker push <node_ip_running_registry>:5000/<patroni>:<version>
```

## Running the cluster

```bash
DOCKER_HOST=ssh://<manager_ip> docker stack deploy -c compose.yml <your-stack-name>
```

## Testing

```bash
psql -h <manager_ip> -U postgres
Password for user postgres: # By default this is patroni
psql (16.5, server 15.10 (Debian 15.10-0+deb12u1))
Type "help" for help.

postgres=#

```

## Making the setup Production-ready.

There are some general steps that you need to follow to make this cluster production ready. 
- Introduce redundancy for ETCD and HAProxy.
- Set up SSL certificates for the registry and the patroni rest endpoints.
- Set safe passwords for the postgres users.
- Harden the allowed IP's for the database connections. You only need to be able to connect from the node running HAProxy.
