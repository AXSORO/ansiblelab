# MASTER image used for Ansible Console

# build from base image
FROM ansible_base:latest

# install ansible
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    ansible

# add ansible scripts and tools from local disk
COPY ansible /var/ans/
# change to copy dest. directory
WORKDIR /var/ans

# creating RSA key for password-less SSH communication 
# this passkey is not sutible for prod. environments - testing only 
RUN ssh-keygen -t rsa -N password -C "master key" -f master_key
COPY welcome.sh /tmp/welcome.sh
RUN chmod +x /tmp/welcome.sh