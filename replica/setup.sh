#!/bin/bash

set -e

wait-for-it master:5432

export PGPASSWORD="test"
export PGSSLMODE="require"

ls -la /var/lib/postgresql/data

pg_basebackup --pgdata=/var/lib/postgresql/data --write-recovery-conf --create-slot --slot=splice \
  --host=master --username=rep_user --port=5432 --verbose --progress

exec /usr/local/bin/docker-entrypoint.sh postgres
