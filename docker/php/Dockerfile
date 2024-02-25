FROM php:5.4-apache

# Composer のバージョン と ハッシュ値
# ARG composer_ver=1.10.13
# ARG composer_hash=5ca7445cfd48dd27c5a84aa005a47b4d9fd91132313830609875df3a6973708f

# Composer の保存先
# ARG composer_path=/usr/local/bin/composer

# RUN apt-get update \
  # Composer インストール
#   && php -r "copy('https://getcomposer.org/download/$composer_ver/composer.phar', '$composer_path');" \
#   && chmod 755 $composer_path \
#   && php -r "if (hash_file('sha256', '$composer_path') !== '$composer_hash') { \
#           echo '!!! Failed to install Composer !!!'; \
#           unlink('$composer_path'); \
#       } \
#       echo PHP_EOL;" \

# Composer インストール
# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#   && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
#   && php -r "unlink('composer-setup.php');"

# RUN apt-get install openssl ca-certificates

COPY --from=composer:1.10.27 /usr/bin/composer /usr/bin/composer








#   && apt-get install -y vim \
#   && apt-get install -y unzip \
#   && apt-get install -y libicu-dev \
#   && docker-php-ext-install intl \
#   && docker-php-ext-install pdo_mysql \
#   && a2enmod rewrite