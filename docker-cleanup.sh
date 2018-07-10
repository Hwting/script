#!/bin/bash

# remove exited containers:
docker ps --filter status=dead --filter status=exited -aq | xargs -r docker rm -v

# remove unused images:
docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs -r docker rmi

# remove unused volumes:
# find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf ( docker ps -aq | xargs docker inspect | jq -r '.[] | .Mounts | .[] | .Name | select(.)') | xargs -r rm -fr
docker volume ls -qf dangling=true | xargs -r docker volume rm

#Cleans all volumes that are not used by any container.

docker volume rm $(docker volume ls -qf dangling=true)
#Clean Images
Cleans all images that are not used by any running container. This includes old versions of images.

docker rmi $(docker images -qf dangling=true)
#Clean exited and dead containers and their volumes
#Cleanes all containers that are not currently running. The -v makes sure the associated volumes are deleted too.

#Be sure you don’t need them any more!

docker rm -v $(docker ps -qf status=dead -f status=exited --no-trunc)
#Update all docker images
#Updates all locally available docker images

docker images --format "{{.Repository}}" --filter "dangling=false" | xargs -L1 docker pull
#Delete all images containing XYZ
docker images --format "{{.Repository}}:{{.Tag}}" | grep XYZ | xargs -L1 docker rmi