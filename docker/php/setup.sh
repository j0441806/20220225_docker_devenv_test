#!/bin/bash

# Backup Apache configuration files
cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bk \
    && cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bk \
    && cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bk \
    && cp /etc/apache2/mods-available/autoindex.conf /etc/apache2/mods-available/autoindex.conf.bk \
    && cp /etc/apache2/mods-available/userdir.conf /etc/apache2/mods-available/userdir.conf.bk

# Update DocumentRoot settings
sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/app|g' /etc/apache2/apache2.conf \
    && sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/app|g' /etc/apache2/sites-available/000-default.conf \
    && sed -i 's|DocumentRoot /var/www/html|DocumentRoot /test/example.com/app|g' /etc/apache2/sites-available/default-ssl.conf \
    && sed -i 's|<Directory /var/www/>|<Directory /test/example.com/>|g' /etc/apache2/apache2.conf \
    && sed -i '/<Directory \/>/,/<\/Directory>/ { s|AllowOverride None|AllowOverride All|; s|Require all denied|Require all granted|; }' /etc/apache2/apache2.conf
