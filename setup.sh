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