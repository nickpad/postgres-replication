FROM postgres:11.1

RUN apt-get update -y
RUN apt-get install -y wait-for-it

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh
