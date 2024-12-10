# (Almost) Production-ready PostgreSQL High Availability Docker Swarm cluster

## Overview

This repository contains an almost production ready Docker Swarm PostgreSQL Patroni cluster routed via HAProxy.

This project is based on:
- [Docker Swarm](https://docs.docker.com/engine/swarm/)
- [Patroni](https://github.com/patroni/patroni)
- [PostgreSQL](https://www.postgresql.org/)
- [HAProxy](https://www.haproxy.org/)

## Getting started

This guide is going to be running the cluster on 3 virtualized machines running [Alpine Linux](https://alpinelinux.org/) using [Virtual Machine Manager (Virt-Manager)](https://virt-manager.org/).
