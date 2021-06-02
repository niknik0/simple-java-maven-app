#Build stage one

FROM ubuntu:18.04 AS build

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    maven
COPY src /usr/local/service/src
COPY pom.xml /usr/local/service/pom.xml
WORKDIR /usr/local/service
RUN mvn clean package

#Build stage two 

FROM ubuntu:18.04 
RUN apt-get update && apt-get install -y \
    openjdk-8-jre
COPY --from=build /usr/src/app/target/my-app-1.0-SNAPSHOT.jar /usr/app/my-app-1.0-SNAPSHOT.jar
EXPOSE 8080
CMD [ "java", "-cp", "/usr/app/my-app-1.0-SNAPSHOT.jar" ]
