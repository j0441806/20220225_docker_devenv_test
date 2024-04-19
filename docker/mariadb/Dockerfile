FROM mariadb:5.5.64

# Backup files
COPY /etc/mysql/my.cnf  /etc/mysql/my.cnf.bk
COPY /etc/mysql/conf.d/mariadb.conf /etc/mysql/conf.d/mariadb.conf.bk

# Initialize database
COPY init/init.sql /docker-entrypoint-initdb.d/
