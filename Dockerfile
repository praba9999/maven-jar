
FROM maven:3.3.9-jdk-8-alpine AS build
RUN apk update
RUN apk add --update libbz2
COPY pom.xml /tmp/
WORKDIR /tmp/
RUN mvn package

FROM openjdk:8-jre-alpine

WORKDIR /tmp/
COPY --from=build /tmp/target/rahul-charan.jar /tmp/rahul-charan.jar
ENTRYPOINT ["java", "-jar", ,"/tmp/rahul-charan.jar "]
