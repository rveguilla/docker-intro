#!/usr/bin/env bash
docker stop app app_db
docker rm -v app app_db
docker network rm app_network