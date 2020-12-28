# Ansible-docker-lab
This repo is intended to be used as a lab to learn or test Ansible playbooks.
It is supported by Docker and has a few requirements: 

## Requirements
You need to have your ssh identities stored in the default path (~/.ssh) and in the default format (id_rsa & id_rsa.pub)
You need Docker & Docker-compose installed
You should not have another container mapped on the 80 port

## How it works
 - 1 deployer machine
 - 2 host machine
    - 1 db 
    - 1 web
 - ssh public key authentication with agent forwarding
 - python version used : 3 
## How to use
 - run `docker-compose up -d `
 - Develop your ansible playbooks and scripts in /ansible/playbooks
 - Connect in your deployer machine using `docker-compose exec deployer bash`
 - Tweak your system configurations in lab/Docker
 - rebuild your configurations if needed using `docker-compose up -d --build`