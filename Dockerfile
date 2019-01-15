FROM python:3.6-alpine

########## ADD LINUX LIBRARIES ##########
RUN apk add git bash docker;

VOLUME ["/etc/pretix", "/data", "/pretix"]
SHELL ["/bin/bash", "-c"]

########## SETUP PRETIX #################
WORKDIR /

RUN git clone --branch master --depth 1 https://github.com/pretix/pretix.git
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENV ROOTDIR /Users/codyredmond/Documents/Work/pretix-dev
ENTRYPOINT ./docker-entrypoint.sh