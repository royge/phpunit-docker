# PHPUnit Docker Container.
FROM ubuntu:trusty
MAINTAINER Roy Evangelista <royevangelista@gmail.com>

RUN apt-get update && \
    apt-get install -y git curl && \
    apt-get install -y php5 php5-mcrypt php5-mysql php5-curl php5-cli && \
    apt-get install -y phpunit && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN curl -sS https://getcomposer.org/installer \
    | sudo php -- --install-dir=/usr/local/bin --filename=composer

CMD ["phpunit"]
