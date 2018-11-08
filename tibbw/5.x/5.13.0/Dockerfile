FROM tibtra:5.10.0

MAINTAINER Daniel Hodrea <daniel.hodrea@accesa.eu>

ADD TIB_ems_8.4.0_linux_x86_64.zip /tmp/install/
ADD TIB_BW_5.13.0_linux26gl23_x86_64.zip /tmp/install/
ADD TIB_dbdrivers_2.0.6_linux_x86_64.zip /tmp/install/
ADD TIB_bwpluginrestjson_2.1.0_linux26gl23_x86_64.zip /tmp/install/

RUN unzip /tmp/install/TIB_ems_8.4.0_linux_x86_64.zip -d /tmp/install/tibems/ && \
sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerizedEnvironment<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="configDirectoryRoot">.*<\/entry>/<entry key="configDirectoryRoot">\/opt<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Server Baseline_ems">.*<\/entry>/<entry key="feature_EMS Server Baseline_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_Development Kit_ems">.*<\/entry>/<entry key="feature_Development Kit_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Client Baseline_ems">.*<\/entry>/<entry key="feature_EMS Client Baseline_ems">true<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Source_ems">.*<\/entry>/<entry key="feature_EMS Source_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Central Administration_ems">.*<\/entry>/<entry key="feature_EMS Central Administration_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
/bin/bash /tmp/install/tibems/TIBCOUniversalInstaller-lnx-x86-64.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
rm -rf /tmp/install/tibems /tmp/install/TIB_ems_8.4.0_linux_x86_64.zip


RUN unzip /tmp/install/TIB_BW_5.13.0_linux26gl23_x86_64.zip -d /tmp/install/tibbw/ && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerEnvironment<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	sed -i 's/<entry key="feature_AMBW Designtime_BW">.*<\/entry>/<entry key="feature_AMBW Designtime_BW">false<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	sed -i 's/<entry key="feature_Documentation_BW">.*<\/entry>/<entry key="feature_Documentation_BW">false<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	/bin/bash /tmp/install/tibbw/TIBCOUniversalInstaller-lnx-*.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
	rm -rf /tmp/install/tibbw/ /tmp/install/TIB_BW_5.13.0_linux26gl23_x86_64.zip


RUN unzip /tmp/install/TIB_dbdrivers_2.0.6_linux_x86_64.zip -d /tmp/install/tibbw/ && \
	sed -i 's/<entry key="installationRoot">.*<\/entry>/<entry key="installationRoot">\/opt\/tibco<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-dbdrivers_*.silent && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerEnvironment<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-dbdrivers_*.silent && \
	/bin/bash /tmp/install/tibbw/TIBCOUniversalInstaller-lnx-*.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
	rm -rf /tmp/install/tibbw/ /tmp/install/TIB_dbdrivers_2.0.6_linux_x86_64.zip

RUN unzip /tmp/install/TIB_bwpluginrestjson_2.1.0_linux26gl23_x86_64.zip -d /tmp/install/tibbw/ && \
	sed -i 's/<entry key="installationRoot">.*<\/entry>/<entry key="installationRoot">\/opt\/tibco<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_bwpluginrestjson_*.silent && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerEnvironment<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_bwpluginrestjson_*.silent && \
	/bin/bash /tmp/install/tibbw/TIBCOUniversalInstaller-lnx-*.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
	rm -rf /tmp/install/tibbw/ /tmp/install/TIB_bwpluginrestjson_2.1.0_linux26gl23_x86_64.zip
	
RUN cp -r /opt/tibco/ems/8.4/lib/. /opt/tibco/tpcl/5.10/lib/

WORKDIR /opt/tibco/bw/5.13/bin	