#!/bin/bash

mkdir -p /var/lib/postgresql/data /var/run/postgresql/sockets
chmod -R 0750 /var/lib/postgresql
chmod -R 0750 /var/run/postgresql
chown -R postgres:postgres /var/lib/postgresql
chown -R postgres:postgres /var/run/postgresql

exec su - postgres -c "patroni /etc/patroni.yml"
