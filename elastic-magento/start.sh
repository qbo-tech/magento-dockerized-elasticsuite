#!/bin/bash

ES_PLUGIN_CMD=/usr/share/elasticsearch/bin/plugin
HOSTS=localhost:9200
CLUSTER_NAME=es

# Deploy configuration
sed -e "s/CLUSTER_NAME/\"$CLUSTER_NAME\"/;s/HOSTS/$HOSTS/;" /tmp/elasticsearch.yml > /usr/share/elasticsearch/config/elasticsearch.yml

