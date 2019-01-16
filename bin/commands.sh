#!/usr/bin/env bash

function error {
	ERRMSG=$@
	COLORIZE="$(tput setaf 1)${ERRMSG}$(tput sgr0)"
  	echo $COLORIZE 1>&2
}

function manage {
	if [ -z $1 ]; then 
		error "Please provide a django management command"
		return
	fi

	docker-compose exec pretix bash -c "python /pretix/src/manage.py $1"
}

function logs {
	# don't watch or follow, won't be able to exit.
	# I'd like to improve this so I can watch the logs.
	docker run --rm -it -v "$(basename $(pwd))_data":/my_mnt alpine /bin/sh -c "tail /my_mnt/logs/pretix.log" 
}

