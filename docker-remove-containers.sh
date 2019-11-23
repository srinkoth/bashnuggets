#/bin/bash
docker ps -a | grep Exited | awk '{print $1}' > stopped-containers
while read -r name; do docker rm $name;echo "Removed container $name"; done < stopped-containers 
