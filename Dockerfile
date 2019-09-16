FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn install
COPY --from=build /usr/src/app/target/rahul-charan.jar /usr/app/rahul-charan.jar  
ENTRYPOINT ["java", "-jar", ,"rahul-charan.jar"]
