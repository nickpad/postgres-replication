#!/bin/bash

# The postgresql.conf file is the main config file for the PG server.
cat <<EOF >> "/etc/postgresql/postgresql.conf"
# Enable SSL.
ssl = on
ssl_cert_file = '/ssl/server.crt'
ssl_key_file = '/ssl/server.key'

# Tell the server to listen for connections on all network interfaces.
listen_addresses = '*'

# The wal_level must be set to "replica" (which is the default) or "logical".
wal_level = replica

# The wal_keep_segments value should be increased from the default of 0. This will
# allow the replica to catch up if it falls slightly begind the master, for example
# if it's temporarily disconnected due to a network issue.
wal_keep_segments = 10
EOF

# Create a replication role with login permission.
# These credentials will be used to connect to the master from the replica instance.
psql --username=$POSTGRES_USER --command "CREATE ROLE splice_rep WITH REPLICATION LOGIN ENCRYPTED PASSWORD 'test';"

# The pg_hba.conf file controls access to the PG server. This script
# writes a config file that allows the "splice_rep" username to open
# a replication connection from any host as long as it supplies the
# correct password.
cat <<EOF >> "/var/lib/postgresql/data/pg_hba.conf"
hostssl replication splice_rep 0.0.0.0/0 md5
EOF
