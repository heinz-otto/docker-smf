# update to smf 2.1.3
* download large upgrade version of your choice (smf_2-1-3_upgrade.xxx) from https://download.simplemachines.org/ 
* I don't find a way with wget - only with Browser on my Windows machine.
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
copy the whole sub directory smf from the actual directory to container smf and overwrite existing files in directory /var/www/smf
```
docker cp ./smf/ smf:/var/www
```
repair ownership 
```
docker exec smf chown -R www-data: /var/www/smf
```
open in Browser http://dockerhost:8500/upgrade.php and follow the steps
