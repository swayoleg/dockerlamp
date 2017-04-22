#!/bin/bash

# docker-compose stop && docker-compose rm -f
# docker rm $(docker ps -a -q -f status=exited)
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)