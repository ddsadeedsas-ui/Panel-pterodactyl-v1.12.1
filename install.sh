#!/bin/bash

# Update System
apt update && apt upgrade -y

# Install Dependencies
apt install -y software-properties-common curl apt-transport-https ca-certificates gnupg

# Add PHP Repository
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

# Install PHP and extensions
apt install -y php8.1 php8.1-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip}

# Install MariaDB (Database)
curl -sS https://mariadb.com | sudo bash
apt install -y mariadb-server

# Install Composer
curl -sS https://getcomposer.org | php -- --install-dir=/usr/local/bin --filename=composer

# Download Pterodactyl v1.12.1
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl
curl -Lo panel.tar.gz https://github.com
tar -xzvf panel.tar.gz
chmod -R 755 storage/* bootstrap/cache/

# Installation complete message
echo "Pterodactyl v1.12.1 files are ready in /var/www/pterodactyl"
