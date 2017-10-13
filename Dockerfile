# PHPUnit Docker Container
FROM phpunit/phpunit:5.0.3

MAINTAINER Roy Evangelista <royevangelista@gmail.com>

RUN apt-get update && \
    apt-get install -yq git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# Set up the command arguments.
ENTRYPOINT ["/usr/local/bin/phpunit"]
CMD ["--help"]
