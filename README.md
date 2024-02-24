# README

## BUILD

`docker compose --env-file ./blog-backend/.env.dev -f dev.docker-compose.yml build`
`docker compose --env-file ./blog-backend/.env.dev -f dev.docker-compose.yml up -d`

## DOWN
`docker compose --env-file ./blog-backend/.env.dev -f dev.docker-compose.yml down`

## Actualizar
`docker compose --env-file ./blog-backend/.env.dev -f dev.docker-compose.yml up -d --force-recreate backend`


## GO TO CONTAINER
`docker exec -it container_name bash`

## DESTROY

> Delete all containers

`docker rm -f $(docker ps -a -q)`

> Delete all volumes

`docker volume rm $(docker volume ls -q)`

> Delete all images

`docker rmi $(docker images -q)`
