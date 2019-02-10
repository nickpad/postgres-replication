FROM postgres:11.1

# Install the wait-for-it package, which will be used in the replica setup script.
RUN apt-get update -y
RUN apt-get install -y wait-for-it

# Copy the setup script into the container.
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh