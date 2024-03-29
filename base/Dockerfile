# BASE image - used for HOST and MASTER images

# latest debian image
FROM debian

# installing tools / update
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        aptitude iputils-ping net-tools man vim openssh-server python3 nano expect \
    && rm -rf /var/lib/apt/lists/*

# create required directories
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh
