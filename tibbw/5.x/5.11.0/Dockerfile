FROM tibtra:5.8.0

MAINTAINER Daniel Hodrea <daniel.hodrea@accesa.eu>

ADD TIB_bw_5.11.0_linux26gl23_x86_64.zip /tmp/install/

RUN unzip /tmp/install/TIB_bw_5.11.0_linux26gl23_x86_64.zip -d /tmp/install/tibbw/ && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerEnvironment<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	sed -i 's/<entry key="feature_AMBW Designtime_BW">.*<\/entry>/<entry key="feature_AMBW Designtime_BW">false<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	sed -i 's/<entry key="feature_Documentation_BW">.*<\/entry>/<entry key="feature_Documentation_BW">false<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	/bin/bash /tmp/install/tibbw/TIBCOUniversalInstaller-lnx-*.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
	rm -rf /tmp/install/tibbw/ /tmp/install/TIB_bw_5.11.0_linux26gl23_x86_64.zip

WORKDIR /opt/tibco/bw/5.11/bin	