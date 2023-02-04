# docker-smf
Docker image for quick & easy setting up a Simple Machines Forum

Tested with version 2.0.15 & 2.1.3
## New simplified version - How to run
* download smf_2-1.._install.tar.gz version from [simplemachines](https://download.simplemachines.org/) in the actual directory. You could not download archieved versions directly by cli.
```
wget https://download.simplemachines.org/index.php/smf_2-0-19_install.tar.gz
wget https://download.simplemachines.org/index.php/smf_2-1-3_install.tar.gz
wget https://download.simplemachines.org/index.php/smf_2-1-3_upgrade.tar.gz
```
* create the working directories and download files 
```
directory=simple-smf
mkdir ${directory} && cd ${directory} && mkdir smf  # create working directories
wget https://raw.githubusercontent.com/heinz-otto/docker-smf/master/{Dockerfile,.env,docker-compose.yml}
tar xzf ../smf_2-1-?_install.tar.gz  -C smf
sudo chown -R www-data:www-data smf/*
```
* Edit the file .env (port,db password), and docker-compose.yml (lines of comment for smf_2-0-*)
* build the image and start up the services
```
docker compose up -d
```
* open http://host:port for setup
  * replace locahost with servicename (mariadb) for database and finish the setup

after setup, remove install.php to preventing a warning message on all pages
```
sudo rm smf/install.php
```
## quick cleanup the whole setup 
caution! all (also database) will be removed
Be carefully, it will removing the actual directory! 
```
docker compose down -v --rmi all
sudo rm -R ${PWD} && cd ..
```
# Old version
## How to run

`docker run -p 8500:80 -e 'SMF_BOARD_URL=http://dockerhost:8500/' eeems/smf`

Access the site with <http://dockerhost:8500>

Admin credentials: `Admin/admin`

## Example
![Screen-recording](https://i.imgur.com/laKoSDV.gif)

## Example docker-compose.yml

use instead docker-compose.yml from github

```yaml
version: '3'
services:
  smf:
    container_name: smf
    image: eeems/smf
    ports:
      - "8500:80"
    environment:
      - SMF_BOARD_URL=http://localhost:8500/

```
