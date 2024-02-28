FROM php:5.4-apache

RUN echo "deb http://archive.debian.org/debian/ stretch main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && apt-get update

# RUN apt-get install openssl ca-certificates

RUN apt-get install -y --allow-unauthenticated lynx

RUN apt-get install -y  --allow-unauthenticated libxslt1-dev
RUN docker-php-ext-configure xsl --with-xsl=/usr/include
RUN docker-php-ext-install xsl


RUN apt-get install -y --allow-unauthenticated vim

COPY --from=composer:1.10.27 /usr/bin/composer /usr/bin/composer

# ドキュメントルートの作成
# RUN mkdir -p /example/www/root/htdocs

# ログフォルダの作成
# RUN mkdir -p /example/www/root/logs

# httpd.confのバックアップを作成
# RUN cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bk

# RUN cp /etc/apache2/mods-available/autoindex.conf /etc/apache2/mods-available/autoindex.conf.bk

# RUN cp /etc/apache2/mods-available/userdir.conf /etc/apache2/mods-available/userdir.conf.bk

# ローカルにソースを配置し、コンテナ内のディレクトリにコピー
# COPY ./xxx /path/in/container/yyy


# その他の設定やコマンドを記述


# RUN apt-get install -y nano
#   && apt-get install -y unzip \
#   && apt-get install -y libicu-dev \
#   && docker-php-ext-install intl \
#   && docker-php-ext-install pdo_mysql \
#   && a2enmod rewrite