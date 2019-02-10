#!/bin/bash

cat <<EOF >> "/var/lib/postgresql/data/pg_hba.conf"
host replication all 0.0.0.0/0 md5
EOF
