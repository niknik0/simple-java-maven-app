#Build stage one

FROM ubuntu:18.04 AS build
RUN wget https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp && \
    sudo tar xf /tmp/apache-maven-*.tar.gz -C /opt && \
    sudo ln -s /opt/apache-maven-3.6.0 /opt/maven

RUN apt-get update && apt-get install -y \
    default-jdk \
    maven
COPY src /usr/local/service/src
COPY pom.xml /usr/local/service/pom.xml
WORKDIR /usr/local/service
RUN mvn clean package
