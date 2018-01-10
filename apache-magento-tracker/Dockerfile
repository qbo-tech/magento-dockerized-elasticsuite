FROM httpd:2.4-alpine

VOLUME /var/www

ENV DOMAIN=t.mysite.com

COPY conf/vhosts.conf /tmp
COPY tracker /var/www/
COPY start /usr/bin/
COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf

RUN chmod +x /usr/bin/start

#Log Cleanning
RUN crontab -l | { cat; echo "0 0 * * * :> /var/log/smile_searchandising_suite/apache_raw_events/magento.log"; } | crontab -

CMD ['crond']

ENTRYPOINT ["/usr/bin/start"]
