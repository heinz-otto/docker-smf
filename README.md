# docker-smf
Docker image for SMF

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
