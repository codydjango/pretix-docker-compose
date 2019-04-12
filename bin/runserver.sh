#!/usr/bin/env bash

docker-compose exec -u 0 pretix bash -c "python /pretix/src/manage.py runserver 0.0.0.0:80";