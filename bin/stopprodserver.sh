#!/usr/bin/env bash

docker-compose exec -u 0 pretix bash -c "supervisorctl stop nginx";