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
        # libapache2-mod-php \
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

# Install Composer
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

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
# mod_rewriteモジュール読み込み
RUN echo "LoadModule rewrite_module /usr/lib/apache2/modules/mod_rewrite.so" >> /etc/apache2/apache2.conf

#php.iniファイルをバックアップ

#php.confをバックアップ

#my.cnfをバックアップ

#server.cnfをバックアップ

# コンテナログイン時のパスを最後に指定
WORKDIR  /test/example.com






