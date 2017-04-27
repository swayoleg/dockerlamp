#!/usr/bin/env bash

## This will cleanup unused containers and images

docker volume rm $(docker volume ls -qf dangling=true)
docker rm $(docker ps -q -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)