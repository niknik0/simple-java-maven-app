#Build stage one

FROM ubuntu:18.04 AS build
RUN apt-get update && apt-get install -y \
    default-jdk \
    maven
COPY src /usr/local/service/src
COPY pom.xml /usr/local/service/pom.xml
WORKDIR /usr/local/service
RUN mvn clean package
