ALTER SYSTEM SET wal_level = replica;
ALTER SYSTEM SET max_wal_senders = 10;
ALTER SYSTEM SET wal_keep_segments = 8;

CREATE USER rep_user WITH REPLICATION ENCRYPTED PASSWORD 'test';