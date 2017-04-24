# Dockerlamp
Docker LAMP sceleton. 
Fast docker web project up for your existing or new web projects. 
If you don't want to waste your time to changing/setuping the envirenment for some wepapps you can simply clone the repo and build the images, and then run your project on builded envirenment.

Only the first build will take some time (You can grab some tee meanwhile), then docker images are cached.

## Project examples
- Its better to look at project_example folder to understand the configuration for your project

## Quick usage

0. Run `sh build.sh` &nbsp;
1. Run `cd project_example/swayoleg.lamp && docker-compose up -d` &nbsp;
2. Open 177.168.1.10 at browser and see phpinfo from project folder

This is basic example of usage.

## Usage

0. Install docker, docker compose, add your user to docker group
1. Build all base images with `sh build.sh` &nbsp; command
2. Copy project_example/swayoleg-lamp to your project folder as %yourprojectpath%/swayoleg-lamp
3. Edit %yourprojectpath%/swayoleg-lamp/.env with your values. The main config option are VIRTUAL_HOST (the domain to work with, without www ) and DB_FOLDER - please make sure it exists and writable
4. Map your dev domain (VIRTUAL_HOST from previous step) to ip of srv container `SRV_IP`  &nbsp; (add 177.168.1.10 yourproject.domain at hosts file)
5. If your project has different web root, please edit .env with `APP_PATH` &nbsp and `URL_ROOT_FOLDER_FROM_APP_PATH` &nbsp; values. More info see at "##### The folder mapping section"
6. Go to %yourprojectpath%/swayoleg-lamp/ and run the docker-compose up -d. `cd swayoleg-lamp && docker-compose up -d` &nbsp;
7. open browser with your domain mapped on `SRV_IP` &nbsp; and see phpinfo


## Configuration with .env

#### Configuration examples

In next example we have the app configured with virtual host for `swayoleg.lamp` &nbsp; domain, aplication root folder is located one level up from swayoleg-lamp folder (in %yourprojectpath%), and application web DOCUMENT ROOT (where server looks for entrypoint) is %yourprojectpath%/hdocs

```
 VIRTUAL_HOST=swayoleg.lamp
 DB_FOLDER=/srv/olegsrv/db_data
 SRV_CONTAINER=swayoleg-lamp-example
 DB_CONTAINER=swayoleg-lamp-db-example
 APP_PATH=..
 URL_ROOT_FOLDER_FROM_APP_PATH=htdocs/
 TERM=xterm
 DB_IP=177.168.1.12
 SRV_IP=177.168.1.10
 NET_GATEWAY=177.168.1.1
 NET_SUBNET=177.168.1.0/22`
```

Please note that `URL_ROOT_FOLDER_FROM_APP_PATH` &nbsp; is a related path from `APP_PATH` &nbsp;
If your project has webroot same as %yourprojectpath% please let the 
`URL_ROOT_FOLDER_FROM_APP_PATH` &nbsp; empty.

In next example we have the app configured with virtual host for `swayoleg.lamp` &nbsp; domain, aplication root folder is located one level up from swayoleg-lamp folder (in %projectfolder%), and application web DOCUMENT ROOT is also at is %projectfolder% folder

```
 VIRTUAL_HOST=swayoleg.lamp
 DB_FOLDER=/srv/olegsrv/db_data
 SRV_CONTAINER=swayoleg-lamp-example
 DB_CONTAINER=swayoleg-lamp-db-example
 APP_PATH=..
 URL_ROOT_FOLDER_FROM_APP_PATH=
 TERM=xterm
 DB_IP=177.168.1.12
 SRV_IP=177.168.1.10
 NET_GATEWAY=177.168.1.1
 NET_SUBNET=177.168.1.0/22`
```

##### The domain name to work with, please specify at: 
`VIRTUAL_HOST` &nbsp; section

- container names ( TIP: use your project name for srv per project and same db container name for all projects, cuz you actually dont need more instances for db )

`SRV_CONTAINER=swayoleg-lamp-example`\
`DB_CONTAINER=swayoleg-lamp-db-example`


##### Terminal export

`TERM=xterm`

##### !!!! Folder on local machine where db is stored, make sure it exists on host machine & writable

`DB_FOLDER=/srv/olegsrv/db_data`

##### Container ips & network, no need to change

```
 DB_IP=177.168.1.12
 SRV_IP=177.168.1.10
 NET_GATEWAY=177.168.1.1
 NET_SUBNET=177.168.1.0/22
```

##### The folder mapping

The flexible folder mapping is working only when you work with your app by domain (not IP).
If you working with webapp by IP it will always look to /var/www/html at srv container which is mapped to %projectfolder% by default, and this can be changed only in docker-compose.yml file.

If you are working with webapp by configured domain at .env file and this domain is mapped to `SRV_IP` &nbsp; at your host machine, you can use flexible path mappings.

```
APP_PATH=..
URL_ROOT_FOLDER_FROM_APP_PATH=htdocs/
```

When you place swayoleg-lamp folder to your %projectflder% please note:
- The `APP_PATH` &nbsp; is the related path from %projectflder%/swayoleg-lamp to show the PATH of your webapp.
- The `URL_ROOT_FOLDER_FROM_APP_PATH_PATH` &nbsp; is the related path from %projectflder% to show the WEB DOCUMENT ROOT of your webapp.
 
## Bash

For server bash connection you can use 

- `docker exec -ti swayoleg-lamp-example bash` where swayoleg-lamp-example is container name, you set at .env file
- `docker-compose exec srv bash`

For mysql bash connection you can use

- `docker exec -ti swayoleg-lamp-db-example bash` where swayoleg-lamp-example is container name, you set at .env file
- `docker-compose exec swayolegdb bash`

## Logs

- Virtual host logs are located at /var/www/*.log folder (its good practice to add this files to your gitignore);
- Mysql logs are located at /var/log/mysql/error.log

## Additional

- You can remove unused docker container images quickly by `sh docker-cleanup.sh`
- The `sh project-cleanup.sh` will remove all built images of this project
- The adminer interface will be available via ${SRV_IP}/adminer/ which is 
177.168.1.10/adminer/ by default
- Use ${DB_IP} (177.168.1.12 by default) for connecting to mysql host.

## Default build

- Apache 2.4.2
- PHP 7.0.1
- Ubuntu 16.04 for web server
- Debian 8.0 Jessie for DB container
- MySQL 5.7 


Feel free to make an issue or ask for help.

