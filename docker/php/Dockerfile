FROM php:5.4-apache

# Update package sources
RUN echo "deb http://archive.debian.org/debian/ stretch main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && apt-get update

# Install required packages
RUN apt-get install -y --allow-unauthenticated \
        lynx \
        libxslt1-dev \
        libpng-dev \
        openssl ca-certificates \
        vim \
        zip unzip \
        libicu-dev \
    && docker-php-ext-configure xsl --with-xsl=/usr/include \
    && docker-php-ext-install \
            xsl \
            mbstring \
            intl \
            gd \
            mysqli \
            pdo_mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache rewrite module
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

# mod_rewriteモジュール読み込み
# RUN echo "LoadModule rewrite_module /usr/lib/apache2/modules/mod_rewrite.so" >> /etc/apache2/apache2.conf

# Install Composer
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# COPY php.ini /usr/local/etc/php/

# Initial setup
COPY setup.sh /tmp/setup.sh
RUN chown www-data:www-data /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
RUN /tmp/setup.sh

# Set working directory
WORKDIR  /test/example.com
