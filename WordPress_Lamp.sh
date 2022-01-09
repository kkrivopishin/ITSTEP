#! /bin/bash
current_location=$PWD
wp_string='127.0.0.1 wordpresssite.net'

#Installation Apache2 Server
sudo apt-get update && apt-get upgrade -y
sudo apt-get install apache2 apache2-utils -y

#Preconfiguration
sudo mkdir /var/www/wordpress
sudo cp wordpress.conf /etc/apache2/sites-available/

#Enable Apache2 Server
cd /etc/apache2/sites-available/  
sudo a2ensite wordpress.conf
cd $current_location
sudo systemctl reload apache2

#Added host to /etc/hosts
sudo sed -i '/127.0.0.1 wordpresssite.net/d' /etc/hosts
echo $wp_string | sudo tee -a /etc/hosts

#Installation Mariadb
sudo apt-get install mariadb-server mariadb-client -y
echo -e "\n\nn\n\nn\n\n\n" | sudo mysql_secure_installation 2>/dev/null

#Configuration Mariadb
sudo mysql -e "CREATE DATABASE wordpressdb;"
sudo mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'wp1234';"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpressdb. * TO 'wpuser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

#Installation PHP and additional modules
sudo apt install php7.4 php7.4-mysql libapache2-mod-php7.4 php7.4-cli php7.4-cgi php7.4-gd -y

#Installation Wordpress
cd /tmp
sudo apt-get install wget -y
sudo wget https://wordpress.org/latest.tar.gz
sudo apt-get install tar -y
sudo tar xzvf latest.tar.gz
cd $current_location
sudo cp wp-config.php /tmp/wordpress
sudo cp -a /tmp/wordpress/. /var/www/wordpress
sudo chown -R www-data:www-data /var/www/wordpress
sudo apt-get install curl -y
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
wp core download --locale=en_US
wp core install --url=wordpresssite.net --title=wordpresssite.net --admin_user=admin --admin_password=wp1234 --admin_email=info@example.com
sleep 10
xdg-open http://wordpresssite.net 2>/dev/null
