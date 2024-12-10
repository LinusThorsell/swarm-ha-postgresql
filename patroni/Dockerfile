FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    postgresql \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install patroni[psycopg3,etcd]

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
