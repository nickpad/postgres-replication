FROM postgres:11.1

# Install the wait-for-it package, which will be used in the start_replication script.
RUN apt-get update -y
RUN apt-get install -y wait-for-it

# Copy the start_replication script into the container.
COPY start_replication.sh /start_replication.sh
RUN chmod +x /start_replication.sh