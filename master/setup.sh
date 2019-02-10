#!/bin/bash

# The pg_hba.conf file controls access to the PG server. This script
# writes a config file that allows the "splice_rep" username to open
# a replication connection from any host as long as it supplies the
# correct password.

cat <<EOF >> "/var/lib/postgresql/data/pg_hba.conf"
hostssl replication splice_rep 0.0.0.0/0 md5
EOF
