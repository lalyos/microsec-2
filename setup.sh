#!/bin/bash

docker run -d \
  --net=blue \
  -e POSTGRES_PASSWORD=s3cr3t \
  -v testdata:/var/lib/postgresql/data \
  -v $PWD/sql:/docker-entrypoint-initdb.d \
  --name mydb \
  postgres:14-alpine


docker run -d \
  --name backend \
  --net=blue \
  cmd.cat/curl/psql \
  sleep 9999

  PGPASSWORD=s3cr3t psql -U postgres -h 172.17.0.3  postgres -c "select * from vip;"


  echo "Coral" | docker config create prod-lunch-color -
  echo "PROD-VEGE" | docker config create prod-lunch-title -
  docker secret create prod-lunch-body -

  docker service create \
    --name vege-prod \
    --config source=prod-lunch-title,target=/etc/lunch/title,mode=0400 \
    --config source=prod-lunch-color,target=/etc/lunch/color,mode=0400 \
    --secret source=prod-lunch-body,target=/etc/lunch/body,mode=0400 \
    --env TITLE_FILE=/etc/lunch/title \
    --env COLOR_FILE=/etc/lunch/color \
    --env BODY_FILE=/etc/lunch/body \
    -p 30090:80 \
    lalyos/lunch:v8