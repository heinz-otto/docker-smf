# based on image php:apache or special version
ARG BASE_IMAGE="php"
ARG BASE_IMAGE_TAG="apache"    # available tags https://hub.docker.com/_/php/tags
FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}
# setup dependencies for php extensions 
RUN apt-get update && apt-get install -y libxml2-dev libpng-dev
# further Information about install php extensions: https://hub.docker.com/_/php
RUN docker-php-ext-install mysqli simplexml mbstring gd
