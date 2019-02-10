FROM postgres:11.1

COPY postgresql.conf /etc/postgresql/postgresql.conf

RUN mkdir -p /docker-entrypoint-initdb.d
COPY recovery.sh /docker-entrypoint-initdb.d/recovery.sh
RUN chmod +x /docker-entrypoint-initdb.d/recovery.sh
