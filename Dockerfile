FROM maven:3.3.9-jdk-8-alpine AS build

WORKDIR /usr/src/app
ADD . /usr/src/app/

RUN apk add --no-cache procps &&  mvn clean install 

FROM openjdk:8-jre-alpine

WORKDIR /usr/src/app/

COPY --from=build /usr/src/app/target/rahul-charan.jar /usr/app/rahul-charan.jar  

ENTRYPOINT ["java", "-jar", ,"rahul-charan.jar"]

