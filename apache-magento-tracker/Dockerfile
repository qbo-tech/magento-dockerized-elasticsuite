FROM httpd:2.4-alpine

VOLUME /var/www

ENV DOMAIN=t.mysite.com

COPY conf/vhosts.conf /tmp
COPY tracker /var/www/
COPY start /usr/bin/
COPY conf/httpd.conf /usr/local/apache2/conf/httpd.conf

RUN chmod +x /usr/bin/start

ENTRYPOINT ["/usr/bin/start"]
