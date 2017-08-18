from logstash:2.1

COPY start.sh /usr/bin/start.sh
COPY logstash-configuration/es-template.json /etc/logstash/es-template.json
COPY logstash-configuration/injest-events-filter.conf.sample /etc/logstash/conf.d/injest-events-filter.conf
COPY logstash-configuration/injest-events-output.conf.sample /tmp
COPY logstash-configuration/injest-events-input.conf.sample /tmp

RUN chmod +x /usr/bin/start.sh

VOLUME ["/data"]

CMD ["/usr/bin/start.sh"]
#CMD ["logstash","agent","-f","/etc/logstash/conf/"]


