#!/bin/bash

# 1. Update and install dependencies (Ubuntu/Debian)
apt update && apt install -y software-properties-common curl apt-transport-https ca-certificates gnupg
add-apt-repository -y ppa:ondrej/php
apt update
apt install -y php8.2 php8.2-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip} mariadb-server nginx tar unzip git redis-server

# 2. Setup Panel Directory
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl

# 3. Download YOUR panel files from your repo
echo "Downloading your Pterodactyl files..."
curl -L https://github.com -o panel.zip
unzip main.zip
mv Panel-pterodactyl-v1.12.1-main/* .
rm -rf Panel-pterodactyl-v1.12.1-main main.zip

# 4. Set standard permissions
chmod -R 755 storage/* bootstrap/cache
chown -R www-data:www-data /var/www/pterodactyl/*

echo "Successfully installed to /var/www/pterodactyl!"
