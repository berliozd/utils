#!/usr/bin/env bash

# Variables
#------------
vHostName='mfi'
vHostRootFolder='/home/didier/src/magento-freshinstall'

# VHosts
# --------------------
# Create the file with VirtualHost configuration in /etc/apache2/site-available/
sudo -- sh -c "echo '<VirtualHost *:80>
    DocumentRoot ${vHostRootFolder}
    ServerAdmin admin@${vHostName}.local
    ServerName ${vHostName}.local
    SetEnv MAGE_IS_DEVELOPER_MODE \"1\"
    <Directory ${vHostRootFolder}>
        Options +Indexes +FollowSymLinks +MultiViews +Includes
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/${vHostName}.local.conf"
# Add the host to the hosts file
sudo -- sh -c "echo 127.0.0.1 ${vHostName}.local >> /etc/hosts"
sudo a2ensite ${vHostName}.local.conf
sudo service apache2 restart


