# PHPUnit Docker Container.
FROM ubuntu:trusty
MAINTAINER Roy Evangelista <royevangelista@gmail.com>

RUN apt-get update && \
    apt-get install -y git curl wget && \
    apt-get install -y php5 php5-mcrypt php5-mysql php5-curl php5-cli php5-mbstring php5-gd php5-xml php5-intl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://phar.phpunit.de/phpunit-5.7.19.phar && \
    chmod +x phpunit-5.7.19.phar && \
    mv phpunit-5.7.19.phar /usr/local/bin/phpunit

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

CMD ["phpunit"]
