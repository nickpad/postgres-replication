-- The wal_level must be set to "replica" (which is the default) or "logical".
ALTER SYSTEM SET wal_level = replica;

-- The wal_keep_segments value should be increased from the default of 0. This will
-- allow the replica to catch up if it falls slightly begind the master, for example
-- if it's temporarily disconnected due to a network issue.
ALTER SYSTEM SET wal_keep_segments = 10;

-- Creates a replication role with login permission. These credentials will be
-- used to connect to the master from the replica instance.
CREATE ROLE splice_rep WITH REPLICATION LOGIN ENCRYPTED PASSWORD 'test';