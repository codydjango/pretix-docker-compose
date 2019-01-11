#!/usr/bin/env bash

echo "Sleep 1 sec: Avoid racecondition with db"
sleep 1

python3 server.py
# python3 manage.py compilemessages
# python3 manage.py compilejsi18n
# python3 manage.py collectstatic --noinput
# python3 manage.py compress
# python3 -m pretix migrate --noinput
# uwsgi uwsgi.ini