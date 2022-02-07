FROM php:7.4-apache

RUN apt-get update && apt-get install apache2-utils wget -y

COPY wordpress.conf /etc/apache2/sites-available/wordpress.conf
WORKDIR /etc/apache2/sites-available/
RUN a2ensite wordpress.conf

WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz -O /var/www/wordpress.tar.gz
RUN tar xzvf wordpress.tar.gz

COPY wp-config.php /var/www/wordpress/wp-config.php
RUN chown -R www-data:www-data /var/www/wordpress
WORKDIR /var/www/wordpress/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN cp -R /var/www/wordpress/* /var/www/html/

RUN echo "<? phpinfo(); ?>" > /var/www/html/phpinfo.php
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# PHP Extensions - docker-php-ext-install
RUN docker-php-ext-install mysqli

EXPOSE 80
