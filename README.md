# Postgres streaming replication example

This repo provides a minimal config for setting up [Postgres streaming
replication][1].

This is not intended in any way to be put into production. Instead it's a
starting point for understanding how to configure streaming replication and an
easy way of testing configuration changes.

## Getting started

You'll first need to install Docker if you haven't already.

Docker Compose is used to set up two containers, one acting as the master
database instance and the second as the read-only replica.

To build the master and replica containers for the first time, run:

```
docker-compose build
```

You can then start the containers by running:

```
docker-compose up
```

And stop them by running:

```
docker-compose down
```

The master is mapped to local port 5000, and you can connect to it using `psql`:

```
psql --port=5500 --host 0.0.0.0 --user postgres
```

The replica is mapped to local port 5001:

```
psql --port=5501 --host 0.0.0.0 --user postgres
```

You can check the replication status by running this query on the master:

```
SELECT * FROM pg_stat_replication;
```

Streaming replication physically replicates the Postgres data from the master to
the replica, which means that all databases, schemas, tables and so on are
automatically replicated. [DDL][2] changes are replicated, so any schema changes
on the master automatically get pushed to the replica.

[1]: https://www.postgresql.org/docs/current/warm-standby.html#STREAMING-REPLICATION
[2]: https://www.postgresql.org/docs/current/ddl.html
