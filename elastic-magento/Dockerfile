from elasticsearch:1.5

COPY start.sh /usr/bin/start.sh
COPY es-conf-templates/logging.yml /etc/elasticsearch/
COPY es-conf-templates/elasticsearch.yml /tmp/

RUN chmod +x /usr/bin/start.sh

RUN /usr/share/elasticsearch/bin/plugin -r head
RUN /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin -r kopf
RUN /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/master
RUN /usr/share/elasticsearch/bin/plugin -r analysis-icu
RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-analysis-icu/2.5.0
RUN /usr/share/elasticsearch/bin/plugin -r analysis-phonetic
RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-analysis-phonetic/2.5.0

CMD ["/usr/bin/start.sh"]
CMD ["elasticsearch"]

