FROM alpine AS build
RUN apk add --no-cache maven

WORKDIR /usr/src/app
ADD . /usr/src/app/

RUN apk add --no-cache procps &&  mvn clean install 

# FROM openjdk:8-jre-alpine
FROM openjdk:11-jdk-slim
WORKDIR /usr/src/app/

COPY --from=build /usr/src/app/target/rahul-charan.jar /usr/app/rahul-charan.jar  

ENTRYPOINT ["java", "-jar", ,"rahul-charan.jar"]

