FROM ubuntu:16.04

RUN apt-get update && apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget nginx

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle 

RUN rm -rf /var/www/html/*
COPY frontend.zip /var/www/html/
RUN rm -rf frontend.zip
WORKDIR /var/www/html
RUN unzip frontend.zip
RUN cd /var/www/html/dist 
RUN mv * ../
RUN rm -rf dist/
RUN ls -ltr

RUN mkdir /opt/seif
WORKDIR /opt/seif
COPY start.sh /opt/seif/
RUN chmod +x start.sh
COPY safety-1.0-SNAPSHOT.jar /opt/seif/
COPY auth-1.0-SNAPSHOT.jar /opt/seif/
RUN ls -ltr

VOLUME /var/www/html
VOLUME /opt/seif

EXPOSE 80 8080
CMD ["/opt/seif/start.sh"]
