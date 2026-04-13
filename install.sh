#!/bin/bash

# 1. Install unzip and curl
apt update && apt install -y unzip curl

# 2. Create the panel folder
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl

# 3. Download YOUR panel.zip
# Replace 'panel.zip' with your exact filename if it's different
echo "Downloading your panel files..."
curl -L https://github.com -o panel.zip

# 4. Extract and Cleanup
echo "Unpacking..."
unzip -o panel.zip
rm panel.zip

# 5. Fix permissions
chmod -R 755 storage/* bootstrap/cache
chown -R www-data:www-data /var/www/pterodactyl/*

echo "Done! Files are ready in /var/www/pterodactyl"
