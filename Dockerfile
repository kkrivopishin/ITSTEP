FROM php:7.4-apache

RUN apt-get update && apt-get install  apache2-utils -y

COPY wordpress.conf /etc/apache2/sites-available/wordpress.conf
WORKDIR /etc/apache2/sites-available/
RUN a2ensite wordpress.conf
RUN service apache2 restart

WORKDIR /var/www/
ADD  https://wordpress.org/latest.tar.gz /var/www/wordpress-5.9.tar.gz
RUN tar xzvf wordpress-5.9.tar.gz

COPY wp-config.php /var/www/wordpress/wp-config.php
RUN chown -R www-data:www-data /var/www/wordpress
WORKDIR /var/www/wordpress/


ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
WORKDIR /usr/local/bin/
RUN chmod +x wp
WORKDIR /var/www/wordpress/
RUN cp  -R /var/www/wordpress/* /var/www/html/
# RUN wp core download --locale=en_US
EXPOSE 80
# RUN wp core install --url=wordpresssite.net --title=wordpresssite.net --admin_user=admin --admin_password=wp1234 --admin_email=info@example.com