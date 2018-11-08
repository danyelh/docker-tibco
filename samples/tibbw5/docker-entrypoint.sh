#!/bin/bash

set -e

if [[ -z $DOMAIN ]]; then
        export DOMAIN=DockerDomain
        echo 'INFO: missing environment variable DOMAIN, using default value instead ('$DOMAIN')'
fi

sed -i 's/<DomainName>.*<\/DomainName>/<DomainName>'$DOMAIN'<\/DomainName>/g' /opt/tibco/tra/5.10/template/domainutility/cmdline/AddMachine.xml
sed -i 's/<AdministratorUsername>.*<\/AdministratorUsername>/<AdministratorUsername>admin<\/AdministratorUsername>/g' /opt/tibco/tra/5.10/template/domainutility/cmdline/AddMachine.xml
sed -i 's/<AdministratorPassword>.*<\/AdministratorPassword>/<AdministratorPassword>admin<\/AdministratorPassword>/g' /opt/tibco/tra/5.10/template/domainutility/cmdline/AddMachine.xml

cd /opt/tibco/tra/5.10/bin

./domainutilitycmd -cmdFile /opt/tibco/tra/5.10/template/domainutility/cmdline/AddMachine.xml

cd /opt/tibco/tra/domain/$DOMAIN/
./hawkagent_$DOMAIN &

cd /opt/tibco/tra/5.10/bin/

./AppManage -export \
	-out ~/Presto_In_UpsertESLFeatures_ServiceLayer.xml \
	 -ear /opt/Presto_In_UpsertESLFeatures_ServiceLayer.ear

sed -i 's/<machine>.*<\/machine>/<machine>'$HOSTNAME'<\/machine>/g' ~/Presto_In_UpsertESLFeatures_ServiceLayer.xml
sed -i 's/<binding name="">/<binding name="Presto_In_UpsertESLFeatures_ServiceLayer-PRESTO01_LB">/g' ~/Presto_In_UpsertESLFeatures_ServiceLayer.xml

./AppManage -deploy \
	-app Presto_Services/Presto_In_UpsertESLFeatures/Presto_In_UpsertESLFeatures-PRESTO01-$HOSTNAME \
	-ear /opt/Presto_In_UpsertESLFeatures_ServiceLayer.ear \
	-deployConfig ~/Presto_In_UpsertESLFeatures_ServiceLayer.xml \
	-domain $DOMAIN \
	-user admin \
	-pw admin \
	-nostart \
	-timeout 1 \
	-force

/opt/tibco/tra/domain/$DOMAIN/application/Presto_In_UpsertESLFeatures_ServiceLayer*/Presto_In_UpsertESLFeatures_ServiceLayer-*.sh

exec "$@"