FROM php:5.4-apache

RUN echo "deb http://archive.debian.org/debian/ stretch main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && apt-get update

RUN apt-get install -y --allow-unauthenticated lynx

RUN apt-get install -y  --allow-unauthenticated libxslt1-dev libpng-dev
RUN docker-php-ext-configure xsl --with-xsl=/usr/include
RUN docker-php-ext-install xsl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install intl
RUN docker-php-ext-install gd

# RUN apt-get update && apt-get install -y --no-install-recommends --allow-unauthenticated \
#         libfreetype6-dev \
#         libjpeg62-turbo-dev \
#         libpng-dev \
#         libicu-dev \
#         libxml2-dev \
#         libxslt1-dev \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install -j$(nproc) \
#         gd \
#         mbstring \
#         intl \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -y \
# 		libfreetype-dev \
# 		libjpeg62-turbo-dev \
# 		libpng-dev \
# 	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
# 	&& docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y --allow-unauthenticated openssl ca-certificates

RUN apt-get install -y --allow-unauthenticated vim
RUN apt-get install -y --allow-unauthenticated zip unzip

COPY --from=composer:1.10.27 /usr/bin/composer /usr/bin/composer


# ドキュメントルートの作成
RUN mkdir -p /test/example.com/htdocs
RUN chown -R www-data:www-data /test/example.com/htdocs/
RUN chmod -R 755 /test/example.com/htdocs/
# RUN echo "Hello" > /test/example.com/htdocs/index.html

# RUN chown -R www-data:www-data /test/example.com

# RUN mkdir -p /test/example.com/app
# RUN chown -R www-data:www-data /test/example.com/app/
# RUN chmod -R 755 /test/example.com/app/

# ログフォルダの作成
# RUN mkdir -p /test/www/example.com/logs

#mineタイプファイルをhttp/conf配下にも配置


# httpd.confのバックアップを作成
RUN cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bk
RUN cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bk
RUN cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bk

# Apacheの設定を変更してDocumentRootを更新する
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/htdocs|g' /etc/apache2/apache2.conf
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/htdocs|g' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/htdocs|g' /etc/apache2/sites-available/default-ssl.conf



RUN cp /etc/apache2/mods-available/autoindex.conf /etc/apache2/mods-available/autoindex.conf.bk
RUN cp /etc/apache2/mods-available/userdir.conf /etc/apache2/mods-available/userdir.conf.bk


# Apacheを再起動
# RUN service apache2 restart

# コンテナログイン時のパスを最後に指定
WORKDIR  /test/example.com/htdocs




#php.iniファイルをバックアップ

#php.confをバックアップ

#my.cnfをバックアップ

#server.cnfをバックアップ





# ローカルにソースを配置し、コンテナ内のディレクトリにコピー
# COPY ./xxx /path/in/container/yyy


# その他の設定やコマンドを記述


# RUN apt-get install -y nano
#   && apt-get install -y unzip \
#   && apt-get install -y libicu-dev \
#   && docker-php-ext-install intl \
#   && docker-php-ext-install pdo_mysql \
#   && a2enmod rewrite