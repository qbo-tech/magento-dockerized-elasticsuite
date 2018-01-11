#!/bin/bash

ES_PLUGIN_CMD=/usr/share/elasticsearch/bin/plugin
HOSTS=localhost
CLUSTER_NAME=elasticsearch

echo "Deploying ElasticSearch Config..."
# Deploy configuration
sed -e "s/CLUSTER_NAME/\"$CLUSTER_NAME\"/;s/HOSTS/$HOSTS/;" /tmp/elasticsearch.yml > /usr/share/elasticsearch/config/elasticsearch.yml

echo "Done!"

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of user-mutable directories to elasticsearch
	for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
	; do
		chown -R elasticsearch:elasticsearch "$path"
	done
	
	set -- gosu elasticsearch "$@"
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
