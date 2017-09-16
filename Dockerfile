FROM build.guidoo.com.br:5000/seif

WORKDIR /opt/seif
COPY start.sh /opt/seif/
RUN chmod +x start.sh
COPY safety-1.0-SNAPSHOT.jar /opt/seif/
COPY auth-1.0-SNAPSHOT.jar /opt/seif/
COPY frontend.zip /opt/seif

RUN unzip frontend.zip && rm -rf frontend.zip

EXPOSE 80 443

CMD ["/opt/seif/start.sh"]
