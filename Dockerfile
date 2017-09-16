FROM build.guidoo.com.br:5000/seif

RUN mkdir /opt/seif
WORKDIR /opt/seif
COPY start.sh /opt/seif/
COPY safety-1.0-SNAPSHOT.jar /opt/seif/
COPY auth-1.0-SNAPSHOT.jar /opt/seif/
COPY frontend.zip /opt/seif

RUN unzip frontend.zip && rm -rf frontend.zip


