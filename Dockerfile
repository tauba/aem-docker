FROM cogniteev/oracle-java

MAINTAINER Vinicius Maciel <vmaciel.dev@gmail.com>

RUN mkdir /opt/aem
WORKDIR /opt/aem/

ENV CQ_JVM_OPTS   "-server -Xmx1524M -Xms1200M -Djava.awt.headless=true"

COPY ./AEM_6.1_Quickstart.jar /opt/aem/AEM_6.4_Quickstart.jar
COPY ./start /opt/aem/start
RUN cd /opt/aem && java -Djava.awt.headless=true -jar AEM_6.4_Quickstart.jar -unpack -r nosamplecontent

ENTRYPOINT ["/opt/aem/start"]
