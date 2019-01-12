FROM python:3.6-alpine
COPY . /app
RUN apk add bash
SHELL ["/bin/bash", "-c"]
EXPOSE 8000
WORKDIR /app/pretix
ENTRYPOINT ["/app/pretix/docker-entrypoint.sh"]