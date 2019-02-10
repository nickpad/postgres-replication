#!/bin/bash

cat <<EOF >> "/var/lib/postgresql/data/pg_hba.conf"
host replication rep_user 0.0.0.0/0 md5
EOF
