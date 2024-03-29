# HOST image used for managed clients

# using base image for building
FROM ansible_base:latest

# add script into image volume
COPY run.sh /var/

# make init script executable
RUN chmod 755 /var/run.sh
