ALTER SYSTEM SET wal_level = replica;
ALTER SYSTEM SET max_wal_senders = 10;
ALTER SYSTEM SET wal_keep_segments = 8;

CREATE USER replication WITH REPLICATION ENCRYPTED PASSWORD 'test';

-- SELECT * FROM pg_create_physical_replication_slot('splice');
