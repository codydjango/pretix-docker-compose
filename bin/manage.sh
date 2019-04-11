#!/usr/bin/env bash

function error {
	ERRMSG=$@
	COLORIZE="$(tput setaf 1)${ERRMSG}$(tput sgr0)"
  	echo $COLORIZE 1>&2
}

if [ -z $1 ]; then 
	error "Please provide a django management command"
	return
fi

docker-compose exec pretix bash -c "python /pretix/src/manage.py $1"
