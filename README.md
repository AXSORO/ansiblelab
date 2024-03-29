# intro
a six [host](./host/), single [master](./master/) container project for creating an [Ansible](https://www.ansible.com/) lab environment made uisng [docker-compose](https://docs.docker.com/compose/). there is a ["base"](./base/) image that is used to build the master/hosts off of.

these machines are based off the lastest build of [debian](https://www.debian.org/).

# first steps
the [compose](./docker-compose.yml) file, dockerfiles for each container, and scripts included in this repo will set up and configure *most* of what is needed to get started. 


there are 2 files in the main folder of this repo, a [reset_environment.sh](./reset_environment.sh) and [build_environment.sh](./build_environment.sh) file:

the build script will.. build the environment with docker-compose, then properly exec into the master container and run the welcome script. 

the reset script will remove all containers, images, and volumes that were created by this project. this will not touch your other containers/images/volumes, and is specifically targeted to this lab only. 

# environment concept 
the 6 hosts are down to these "functions", despite them not having any tools installed prior. these functions are just for naming and mockup purposes

2x "web" servers

1x "database" server

3x "workstation" containers


# manual setup
if you don't want to use the [build_environment.sh](./build_environment.sh)

to build using the [docker-compose.yml](./docker-compose.yml) file:

` docker-compose up -d --build ` 

once done, exec into the 'master' container:

` docker exec -it master bash ` 

then, set up the ssh agent, and add the master RSA key configured and created by the dockerfile:

` ssh-agent bash `

add the key:

` ssh-add master_key ` 

(the default pw is 'password' - just a placeholder. definitely not secure)

in the /var/ans directory, which you should be in on exec, 
run:
` ansible-playbook -i inventory ping_all.yml ` 
to test SSH connection (file from original [repo](https://github.com/LMtx/ansible-lab-docker) stated at bottom of readme!)
(note, it will probably bombard you with fingerprint notifs. just type 'yes', wait, and so on. or ssh into them by hostname manually) 

when all comes back okay, you're all set! ssh into the other machines as you please, build some playbooks, change things around, the world is yours.

# manual removal
run the [reset_environment.sh](./reset_environment.sh) file, or, run these commands:

` docker-compose kill ` - stop entire lab environment

` docker-compose rm -f ` - remove all containers related to project

` docker volume rm ansiblelab_ansible_vol ` - remove volume created by compose

` docker rmi ansible_host ansible_master ansible_base ` - remove all images made by compose





## Thanks to LMtx for the original idea - and base for this project 
Original Repo: [https://github.com/LMtx/ansible-lab-docker](https://github.com/LMtx/ansible-lab-docker)

