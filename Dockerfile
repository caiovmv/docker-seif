FROM build.guidoo.com.br:5000/seif-base

RUN mkdir -p /etc/letsencrypt
RUN rm -rf /var/www/html/*
COPY frontend.zip /var/www/html/
RUN rm -rf frontend.zip
WORKDIR /var/www/html
RUN unzip frontend.zip
RUN mv /var/www/html/dist/* /var/www/html/
RUN rm -rf /var/www/html/dist.
RUN ls -ltr

WORKDIR /opt/seif
COPY start.sh /opt/seif/
RUN chmod +x start.sh
COPY safety-1.0-SNAPSHOT.jar /opt/seif/
COPY auth-1.0-SNAPSHOT.jar /opt/seif/
RUN ls -ltr

VOLUME /var/www/html
VOLUME /etc/letsencrypt
VOLUME /var/lib/mysql
VOLUME /opt/seif

EXPOSE 80 443 8080
CMD ["/opt/seif/start.sh"]
