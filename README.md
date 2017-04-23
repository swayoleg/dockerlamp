# Dockerlamp
Docker LAMP sceleton. #alfabetanotpublicuntested


# Examples
- Its better to look at project_example folder to understand the configuration for your project

# Quick usage

0. Run `sh build.sh`
1. Run `cd project_example/swayoleg.lamp && docker-compose up -d`
2. Open 177.168.1.10 at browser and see phpinfo

This is basic example of usage.

# Usage

0. Install docker, docker compose, add your user to docker group
1. Build all base images with `sh build.sh` command
2. Copy project_example/swayoleg-lamp to your project folder as %yourprojectpath%/swayoleg-lamp
3. Edit %yourprojectpath%/swayoleg-lamp/.env with your values. The main config option are VIRTUAL_HOST (the domain to work with, without www ) and DB_FOLDER - please make sure it exists and writable
4. Map your dev domain (VIRTUAL_HOST from previous step) to loopback (add 127.0.0.1 yourproject.domain at hosts file)
5. If your project has different web root, please edit olegsrv.conf - just add folder name after /var/www/html at DocumentRoot and Directory sections
6. Go to %yourprojectpath%/swayoleg-lamp/ and run the docker-compose up -d. `cd swayoleg-lamp && docker-compose up -d`
7. open browser with your domain mapped on 127.0.0.1


# .env

- domain name

`VIRTUAL_HOST`


- container names 
- TIP: use project name for srv per project and same db container name for all projects

`SRV_CONTAINER=swayoleg-lamp-example`\
`DB_CONTAINER=swayoleg-lamp-db-example`


- terminal export

`TERM=xterm`

- !!!! Folder on local machine where db is stored, make sure it exists on host machine & writable

`DB_FOLDER=/srv/olegsrv/db_data`

- container ips & network, no need to change

`DB_IP=177.168.1.12`\
`SRV_IP=177.168.1.10`\
`NET_GATEWAY=177.168.1.1`\
`NET_SUBNET=177.168.1.0/22`

# Additional

- You can remove quickly unused images by `sh cleanup.sh`
- The `sh rmi.sh` will remove all builded images of this project
- The adminer interface will be available via ${SRV_IP}/adminer which is 
177.168.1.10 by default
- Use ${DB_IP} (177.168.1.12 by default) for connecting to mysql host.

Feel free to make an issue or ask for help.