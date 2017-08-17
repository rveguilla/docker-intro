#!/usr/bin/env bash

# The official MySQL docker image support using environment variables to configure the DB and provides a convenient
# mechanism for initializing the DB: we can mount a directory containing sql files that will be run when the container is
# started for the first time.
docker run \
        --detach \
        --name    app_db \
        --publish 3306:3306 \
        --env     MYSQL_ROOT_PASSWORD=root_password \
        --env     MYSQL_DATABASE=app_database \
        --env     MYSQL_USER=app_user \
        --env     MYSQL_PASSWORD=app_password \
        --volume  ${PWD}/initdb/:/docker-entrypoint-initdb.d \
        mysql:5