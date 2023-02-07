# based on image php:apache or special version
ARG BASE_IMAGE="php"
# only tested 7.1-apache - available tags https://hub.docker.com/_/php/tags
ARG BASE_IMAGE_TAG="7.1-apache"
FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}
ARG BASE_IMAGE_TAG="7.1-apache"
# setup dependencies for php extensions
# newer PHP version needs oniguruma Attention! the test is unsharp at this time
RUN apt-get update && apt-get install -y libxml2-dev libpng-dev && \
    if [ "${BASE_IMAGE_TAG}" = "apache" ]; then apt-get install -y libonig-dev ; fi
# further Information about install php extensions: https://hub.docker.com/_/php
RUN docker-php-ext-install mysqli simplexml mbstring gd
