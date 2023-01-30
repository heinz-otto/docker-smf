# docker-smf
Docker image to Setup quick and easy a Simple Machines Forum
## New simplified version - How to run
First step: download smf_2-1.._install.tar.gz version from [simplemachines](https://download.simplemachines.org/) in the actual directory.
```
directory=simple-smf
mkdir ${directory} && cd ${directory} && mkdir smf  # create working directories
wget https://raw.githubusercontent.com/heinz-otto/docker-smf/master/{Dockerfile,.env,docker-compose.yml}
tar xzf ../smf_2-1-?_install.tar.gz  -C smf
sudo chown -R www-data:www-data smf/*
docker compose up
```
* Edit the files .env and docker-compose.yml according to your needs: port,password
* open http://host:port for setup
* replace locahost with servicename (mariadb) for database and finish the setup
after setup, remove install.php to prevent warning
```
sudo rm smf/install.php
```
# Old version
## How to run
download smf....install.tar.gz version from [simplemachines](https://download.simplemachines.org/) in the actual directory.
```
git clone https://github.com/heinz-otto/docker-smf.git
cd docker-smf
cp ../smf*install.tar.gz .
docker build . -t smf:2.1
```
`docker run -p 8500:80 -e 'SMF_BOARD_URL=http://dockerhost:8500/' smf:2.1`

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
