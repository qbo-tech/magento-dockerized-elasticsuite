#!/bin/bash
#
# Logstash server install
# @author Romain Ruaud
#
# Configuration stuffs
LOGSTASH_VERSION=2.1

if [ "$#" -lt 2 ]; then
    echo "Usage : ./install-tracker.sh TRACKER_LOG_FILE es_server1:port <es_server_2:port> ..."
    echo "Eg. ./install-tracker.sh /var/log/smile_searchandising_suite/apache_raw_events/*.log"
    exit 1
fi

TRACKER_LOG_FILE=${1%/}
HOSTS=`printf -- "\"%s\", " ${@:2} | rev | cut -c3- | rev`

echo $HOSTS
