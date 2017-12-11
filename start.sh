#!/bin/sh

cd /opt/seif

service nginx start && java -jar safety-1.0-SNAPSHOT.jar && java -jar auth-1.0-SNAPSHOT.jar 
