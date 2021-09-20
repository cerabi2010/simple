#FROM registry.apps.ocp4.rp.com/tomcat:latest
FROM docker://registry.apps.ocp4.rp.com/jboss-webserver-5/webserver55-openjdk11-tomcat9-openshift-rhel8:1.0-5.1627001953

MAINTAINER "hanwha-admin" <hanwha-admin@hanwha.paas.honecloud.co.kr>

USER root

ENV TZ=Asia/Seoul

COPY ./target/ROOT.war /opt/jws-5.5/tomcat/webapps
RUN chown -R 1000:root /opt/jws-5.5/tomcat/webapps

#RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

#RUN ln -s /usr/share/zoneinfo/$TZ /etc/lacaltime \
# && sed -i 's/C.utf8/ko_KR.UTF-8/g' /etc/locale.conf

## Copy Scouter agent.java file
#RUN mkdir -p /tmp/rp /app/scouter/current/
#COPY src/* /tmp/rp

## COPY src/scouter-agent-java-2.10.0.jar /app/scouter/current/
#WORKDIR /tmp/rp

#RUN rm -rf /tmp/rp

#CMD ["/bin/bash", "-c", "echo Hello, $name"]
#ENTRYPOINT ["/bin/tail","-f","/dev/null"]
USER 1000
