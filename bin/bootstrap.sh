#!/usr/bin/env bash

docker-compose exec -u 0 pretix bash -c "apt-get update; apt-get install enchant;"
docker-compose exec -u 0 pretix bash -c "pip3 install -r /pretix/src/requirements/dev.txt";
docker-compose exec -u 0 pretix bash -c "python manage.py collectstatic --noinput";
docker-compose exec -u 0 pretix bash -c "python manage.py migrate";
docker-compose exec -u 0 pretix bash -c "python make_testdata.py";
docker-compose exec -u 0 pretix bash -c "supervisorctl stop nginx";