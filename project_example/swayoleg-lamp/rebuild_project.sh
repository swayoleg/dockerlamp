#!/bin/bash

docker-compose down
#export $(cat ./.env | xargs)
sed -E -n 's/[^#]+/export &/ p' ./.env
docker rmi "swayoleglamp_$VIRTUAL_HOST"
docker-compose up -d