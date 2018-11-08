#!/bin/bash

set -e

if [[ -z $DOMAIN ]]; then
        export DOMAIN=DockerDomain
        echo 'INFO: missing environment variable DOMAIN, using default value instead ('$DOMAIN')'
fi

sed -i 's/<DomainName>.*<\/DomainName>/<DomainName>'$DOMAIN'<\/DomainName>/g' /opt/tibco/tra/5.10/template/domainutility/cmdline/CreateDomain.xml
sed -i 's/<AdministratorUsername>.*<\/AdministratorUsername>/<AdministratorUsername>admin<\/AdministratorUsername>/g' /opt/tibco/tra/5.10/template/domainutility/cmdline/CreateDomain.xml
sed -i 's/<AdministratorPassword>.*<\/AdministratorPassword>/<AdministratorPassword>admin<\/AdministratorPassword>/g' /opt/tibco/tra/5.10/template/domainutility/cmdline/CreateDomain.xml
sed -i 's/<AdminHome>.*<\/AdminHome>/<AdminHome>\/opt\/tibco\/administrator\/5.10<\/AdminHome>/g' /opt/tibco/tra/5.10/template/domainutility/cmdline/CreateDomain.xml

cd /opt/tibco/tra/5.10/bin

./domainutilitycmd -cmdFile /opt/tibco/tra/5.10/template/domainutility/cmdline/CreateDomain.xml -domain $DOMAIN

cd /opt/tibco/tra/domain/$DOMAIN/
./hawkagent_$DOMAIN &

cd /opt/tibco/administrator/domain/$DOMAIN/bin/
./tibcoadmin_$DOMAIN 
#ln -sf /dev/stdout /var/log/nginx/access.log 



exec "$@"