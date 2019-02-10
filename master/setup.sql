ALTER SYSTEM SET wal_level = replica;
ALTER SYSTEM SET max_wal_senders = 10;
ALTER SYSTEM SET wal_keep_segments = 8;

CREATE ROLE rep_user WITH REPLICATION LOGIN ENCRYPTED PASSWORD 'test';