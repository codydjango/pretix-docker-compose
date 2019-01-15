FROM alpine:3.4
RUN apk add --no-cache git bash docker;

SHELL ["/bin/bash", "-c"]

WORKDIR /
RUN git clone --branch master --depth 1 https://github.com/pretix/pretix.git
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ./docker-entrypoint.sh