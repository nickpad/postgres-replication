#!/bin/bash

set -e

# First, we need to wait for the master database server to become available
# on port 5432.
wait-for-it master:5432

# These environment variables will be used to authenticate when connecting to the master.
export PGUSER="splice_rep"
export PGPASSWORD="test"
export PGSSLMODE="require"
export PGAPPNAME="splice"
export PGHOST="master"

# Before streaming replication can start, the replica needs to take a base backup of the
# contents of the master. To do this, "pg_basebackup" is used. See the pg_basebackup man
# page for a full explanation of the options that have been used here.
pg_basebackup --pgdata=/var/lib/postgresql/data --write-recovery-conf --create-slot --slot=splice --verbose --progress

# Once the base backup has been taken, postgres can be started. Because we're running
# in a Docker container, the "docker-entrypoint.sh" script that's provided by the
# postgres Docker image is used for this.
exec /usr/local/bin/docker-entrypoint.sh postgres