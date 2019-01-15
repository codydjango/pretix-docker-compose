# Basic Pretix Development Environment

Using docker-compose, nginx-proxy with a self-signed ssl certificate.

docker build -t pretixdev .
docker run --rm -e ROOTDIR=$(pwd) -v /var/run/docker.sock:/var/run/docker.sock pretixdev;