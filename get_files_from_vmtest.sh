#!/usr/bin/env bash

# Variables
sourceRootFolder='/data/httpd/cleor.vmtest.agence-soon.fr/0454-cleor'
destRootFolder='/home/didier/src/tmp'
projectName='cleor'
appFolder='app/etc'
file1='local.xml'
file2='config.xml'
file3='index.php'
file4='.htaccess'

#mkdir ${destRootFolder}/${projectName}

#scp root@46.105.104.227:/data/httpd/cleor.vmtest.agence-soon.fr/0454-cleor/app/etc/local.xml /home/didier/src/tmp/cleor/local.xml
scp root@46.105.104.227:${sourceRootFolder}/app/etc/local.xml ${destRootFolder}/${projectName}/local.xml
scp root@46.105.104.227:${sourceRootFolder}/app/etc/config.xml ${destRootFolder}/${projectName}/config.xml
scp root@46.105.104.227:${sourceRootFolder}/index.php ${destRootFolder}/${projectName}/index.php
scp root@46.105.104.227:${sourceRootFolder}/.htaccess ${destRootFolder}/${projectName}/.htaccess
