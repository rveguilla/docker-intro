#!/usr/bin/env bash

# The official Node docker image contains a node distribution (version 8 in this example).
# To do something useful, we need mount our source directory of our app (in this example, it will be ${PWD}, e.g. the current directory).
# The last parameter after the image name is the command to run inside the container (in our example: node /usr/src/app/index.js)
docker run \
        --detach \
        --name    app \
        --publish 3000:3000 \
        --volume  ${PWD}/:/usr/src/app \
        --network app_network \
        --env DB_HOST=app_db \
        node:8 \
        node /usr/src/app/index.js