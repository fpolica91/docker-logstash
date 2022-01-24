FROM opensearchproject/logstash-oss-with-opensearch-output-plugin:7.16.2
USER root
RUN yum install nano -y 
RUN yum install vim -y
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD logstash/pipeline /usr/share/logstash/pipeline/
ADD logstash/config /usr/share/logstash/config/
USER root

EXPOSE 5000/tcp
EXPOSE 8080/tcp
ENTRYPOINT [ "bin/logstash", "-f", "/usr/share/logstash/pipeline/logstash.conf" ]
