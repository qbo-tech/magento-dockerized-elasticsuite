#!/bin/bash
TRACKER_LOG_FILE=/var/log/smile_searchandising_suite/apache_raw_events/magento.log
HOSTS="elasticsearch:9200"

# Deploy logstash configuration
sed -e "s/SMILE_ELASTICSUITE_TRACKER_TEMPLATE/\/etc\/logstash\/es-template.json/;s/HOSTS/"$HOSTS"/;" /tmp/injest-events-output.conf.sample > /etc/logstash/conf.d/injest-events-output.conf
sed -e "s~SMILE_TRACKER_LOG_FILE~$TRACKER_LOG_FILE~" /tmp/injest-events-input.conf.sample > /etc/logstash/conf.d/injest-events-input.conf

# Ensure corrects ACL for logstash on files
#setfacl -Rm u:logstash:rX /var/log/apache2
#setfacl -m u:logstash:rX /var/log/smile_searchandising_suite/apache_raw_events/
#setfacl -m u:logstash:r $TRACKER_LOG_FILE
usermod -a -G adm logstash

logstash agent -f /etc/logstash/conf.d 2>&1
