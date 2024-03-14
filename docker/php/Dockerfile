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
        libapache2-mod-php \
        libicu-dev \
    && docker-php-ext-configure xsl --with-xsl=/usr/include \
    && docker-php-ext-install \
            xsl \
            mbstring \
            intl \
            gd \
            mysqli \
            pdo_mysql

# Install Composer
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer


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


# Create document root
RUN mkdir -p /test/example.com/htdocs \
    && chown -R www-data:www-data /test/example.com/htdocs/ \
    && chmod -R 755 /test/example.com/htdocs/

#ルートディレクトリの所有者変更
RUN chown -R www-data:www-data /test/example.com

# ログフォルダの作成
# RUN mkdir -p /test/www/example.com/logs

#mineタイプファイルをhttp/conf配下にも配置


# Apache設定ファイルのバックアップ
# Backup Apache configuration files
RUN cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bk \
    && cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bk \
    && cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bk \
    && cp /etc/apache2/mods-available/autoindex.conf /etc/apache2/mods-available/autoindex.conf.bk \
    && cp /etc/apache2/mods-available/userdir.conf /etc/apache2/mods-available/userdir.conf.bk
# Apacheの設定を変更してDocumentRootを更新する
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/sample_project|g' /etc/apache2/apache2.conf \
    && sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/sample_project|g' /etc/apache2/sites-available/000-default.conf \
    && sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/sample_project|g' /etc/apache2/sites-available/default-ssl.conf
# モジュール読み込み
RUN echo "LoadModule rewrite_module /usr/lib/apache2/modules/mod_rewrite.so" >> /etc/apache2/apache2.conf

# Apacheを再起動
# RUN service apache2 restart

# コンテナログイン時のパスを最後に指定
WORKDIR  /test/example.com




#php.iniファイルをバックアップ

#php.confをバックアップ

#my.cnfをバックアップ

#server.cnfをバックアップ


# その他の設定やコマンドを記述


# RUN apt-get install -y nano
#   && apt-get install -y unzip \
#   && apt-get install -y libicu-dev \
#   && docker-php-ext-install intl \
#   && docker-php-ext-install pdo_mysql \
#   && a2enmod rewrite