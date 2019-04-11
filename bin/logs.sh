#!/usr/bin/env bash

# don't watch or follow, won't be able to exit.
# I'd like to improve this so I can watch the logs.
docker run --rm -it -v "$(basename $(pwd))_data":/my_mnt alpine /bin/sh -c "tail /my_mnt/logs/pretix.log" 