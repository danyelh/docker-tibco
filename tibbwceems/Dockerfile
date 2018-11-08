FROM tibbwce:2.3.4


MAINTAINER Daniel Hodrea <daniel.hodrea@accesa.eu>

ADD TIB_ems_8.4.0_linux_x86_64.zip /tmp/install/

RUN unzip /tmp/install/TIB_ems_8.4.0_linux_x86_64.zip -d /tmp/install/tibems/ && \
sed -i 's/<entry key="installationRoot">.*<\/entry>/<entry key="installationRoot">\/tmp\/tibco.home<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerizedEnvironment<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="configDirectoryRoot">.*<\/entry>/<entry key="configDirectoryRoot">\/opt<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Server Baseline_ems">.*<\/entry>/<entry key="feature_EMS Server Baseline_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_Development Kit_ems">.*<\/entry>/<entry key="feature_Development Kit_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Source_ems">.*<\/entry>/<entry key="feature_EMS Source_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Central Administration_ems">.*<\/entry>/<entry key="feature_EMS Central Administration_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
/bin/bash /tmp/install/tibems/TIBCOUniversalInstaller-lnx-x86-64.bin -silent -is:javahome /tmp/tibco.home/tibcojre64/1.8.0/ && \
rm -rf /tmp/install/tibems /tmp/install/TIB_ems_8.4.0_linux_x86_64.zip 

RUN cp -r /tmp/tibco.home/ems/8.4/lib/. /tmp/tibco.home/bwce/2.3/system/lib/