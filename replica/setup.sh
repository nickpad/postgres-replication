#!/bin/bash

cat <<EOF >> /var/lib/postgresql/data/recovery.conf
standby_mode = 'on'
primary_conninfo = 'host=master user=replication password=test port=5432'
# primary_slot_name = 'splice'
EOF
