#!/bin/bash

set -e

# First, we need to wait for the master database server to become available
# on port 5432.
wait-for-it master:5432

# Before streaming replication can start, the replica needs to take a base backup of the
# contents of the master. To do this, "pg_basebackup" is used. See the pg_basebackup man
# page for a full explanation of the options that have been used here.
#
# Note that the PG environment variables set in the docker-compose file are used to
# connect to the master.
pg_basebackup --host=master --pgdata=/var/lib/postgresql/data --write-recovery-conf --progress

# Once the base backup has been taken, postgres can be started. Because we're running
# in a Docker container, the "docker-entrypoint.sh" script that's provided by the
# postgres Docker image is used for this.
exec /usr/local/bin/docker-entrypoint.sh postgres
