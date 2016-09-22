#!/usr/bin/env bash

# Variables
#------------
mysqlUser='root'
mysqlPass='password'
mysqlAppDbName='ltdc'
mysqlAppDbUser='ltdc'
mysqDumpFile='/home/didier/src/tmp/ltdc/DB-LTDC.sql'
vHostName='ltdc'
createDb=false

# create database
if ${createDb}; then
mysql -u ${mysqlUser} -p"${mysqlPass}" << EOF
CREATE DATABASE ${mysqlAppDbName};
CREATE USER '${mysqlAppDbUser}'@'localhost' IDENTIFIED BY '${mysqlAppDbUser}';
GRANT ALL PRIVILEGES ON ${mysqlAppDbName}. * TO '${mysqlAppDbUser}'@'localhost';
EOF
fi

# Import database
mysql -u ${mysqlUser} -p"${mysqlPass}" ${mysqlAppDbName} < ${mysqDumpFile}
mysql -u ${mysqlUser} -p"${mysqlPass}" << EOF
use ${mysqlAppDbName};
update core_config_data set value = 'http://${vHostName}.local/'  where path like '%secure/base_url%';
update core_config_data set value = 'http://${vHostName}.local/'  where path like '%secure/base_link_url%';
update core_config_data set value = 'http://${vHostName}.local/skin/'  where path like '%secure/base_skin_url%';
update core_config_data set value = 'http://${vHostName}.local/media/'  where path like '%secure/base_media_url%';
update core_config_data set value = 'http://${vHostName}.local/js/'  where path like '%secure/base_js_url%';
EOF
