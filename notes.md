# microsec-2

## topics

- docker run
- exit/ctrl-cctrl-d
- detach ctrl-p ctrl-q
- docker attach
- docker exec
- docker rm
- docker container prune
- docker logs
- docker images
- docker top
- docker ps
- docker diff
- docker commit
- docker inspect (image/container)
- docker stop -t 0
- docker start
- docker run
    - -p 8080:80
    - -p 80
    - -P
    - -e TITLE=bigyp
- env vars
    - ${TITLE}
    - ${TITLE:? required}
    - ${TITLE:-default}
    - ${TITLE:=setit}
- [12factor manifest](https://12factor.net/)
- Dockerfile:
    - FROM (use tags!!!!) also `@hash:8716487624381`
    - RUN
        - multiple command &&
        - rm to clean in the same layer
    - EXPOSE
    - CMD
    - ENTRYPOINT
    - VOLUME
    - COPY/ADD (url, tgz)
    - WORKDIR (instead of cd)
- entrypoint/cmd [start.sh](http://start.sh)
    - last command exec
    - use tini/init
    - file-env (TITLE, TITLE_FILE)
    - see library/postgres init script
- HUB:
- linux namespaces
- [ ]  link namespace page
- [ ]  link layerfs
- command
- cmd.cat/dig/ifconfig/curl

## Network types:

- bridge (standard linux)
    - containers 172.17.0.2-
    - 172.17.0.1: HOST
- none
- host (poorman solution)
- container:xxx
- overlay
- docker cretae network blue (DNS 127.0.0.11)

## Volumes

- named: testdata:/dir1
- bind:   /dir/on/host:/dir/in/container
- long version: source:/dir/on/host,target:/dir/in/container,mode=…
- prune

## compose

- composerize.com
- docker-compose.yaml
    - environments
        - BODY=${BODY:-default}
        - .env file
    - image: vs build:
    - profiles (VSCode .devcontainers)
    - automatic DNS (with custom bridge network)
    - labels
- events endpoint
    - https://github.com/nginx-proxy/nginx-proxy
    - https://github.com/lalyos/docker-traefik
        - acme
        - basic auth
        - more [midleware](https://doc.traefik.io/traefik/middlewares/overview/) based on labels
    - create your own : https://github.com/nginx-proxy/docker-gen
    - https://github.com/gliderlabs/logspout
- docker compose up -d —build
- docker compose down (-v)
- network
- profiles
- docker compose -f f1.yaml -f f2.yaml up
- docker-compose-overwrite.yaml (default inclused)

## swarm

- docker run ⇒ docker service create
- docker compose up ⇒ docker stack deploy
- NodePort (30001), loadbalancer, mesh
- Reliability: automatic restart
- rolling update (haelthcheck)
- rollback
- config
- secret
- caveats:
    - profile
    - volume
    - build
    - version: (fo stack minimum 3.0)
