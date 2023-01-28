# update to smf 2.1.3
* download the large upgrade version smf_2-1-3_upgrade.tar.gz from https://download.simplemachines.org/ . I don't know a way with wget - I was doing the job on my windows machine. 
* Than copy the file to dockerhost.
```
scp smf_2-1-3_upgrade.tar.gz user@dockerhost:
```
Login to dockerhost, than extract the copied tar. 
```
mkdir smf && tar xf smf_2-1-3_upgrade.tar.gz -C smf
```
look for container names 
```
docker container ps
```
copy the whole sub directory smf from the actual directory on dockerhost to the container smf directory /var/www/smf (overwrite existing files)
```
docker cp ./smf/ smf:/var/www
```
repair ownership 
```
docker exec smf chown -R www-data: /var/www/smf
```
open in Browser http://dockerhost:8500/upgrade.php and follow the steps
