FROM maven:3.5.4-jdk-8 AS build
COPY src /usr/local/service/src
COPY pom.xml /usr/local/service/pom.xml
WORKDIR /usr/local/service
RUN mvn clean package

#FROM java:8-jre-alpine
#COPY --from=build /usr/src/app/target/my-app-1.0-SNAPSHOT.jar /usr/app/my-app-1.0-SNAPSHOT.jar
#EXPOSE 8080
CMD[ "java", "-cp", "/usr/app/my-app-1.0-SNAPSHOT.jar" ]
