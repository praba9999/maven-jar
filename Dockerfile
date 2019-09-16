FROM maven:3.6.0-jdk-8-alpine AS build
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM openjdk:8-jre-alpine

WORKDIR /tmp/

COPY --from=build /tmp/target/rahul-charan.jar /tmp/rahul-charan.jar  

ENTRYPOINT ["java", "-jar", ,"/tmp/rahul-charan.jar "]
