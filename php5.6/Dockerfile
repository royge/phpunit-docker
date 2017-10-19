# PHPUnit 5.7.19 Docker Container.
FROM ubuntu:xenial

# Author
MAINTAINER Roy Evangelista <royevangelista@gmail.com>

# Update and install software properties
RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties

# Install git, curl, wget and memcache header files
RUN apt-get install -y git curl wget libmemcached-dev

# Install an UTF-8 locale for en_US
RUN apt-get install -y language-pack-en && locale-gen en_US.UTF-8 && export LANG=en_US.UTF-8

# Add custom PHP PPA and update
RUN LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php && apt-get update

# Install required PHP packages
RUN apt-get install -y --force-yes php5.6 php5.6-common php5.6-mcrypt php5.6-mysql php5.6-curl \
    php5.6-cli php5.6-gd php5.6-intl php5.6-mbstring php5.6-json php5.6-opcache \
    php5.6-xsl php5.6-zip php5.6-xml php-memcached

# Clean
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and install phpunit 5.7.19
RUN wget https://phar.phpunit.de/phpunit-5.7.19.phar && \
    chmod +x phpunit-5.7.19.phar && \
    mv phpunit-5.7.19.phar /usr/local/bin/phpunit

# Download and install composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

CMD ["phpunit"]
