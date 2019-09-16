FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn install
COPY --from=maven_tool_chain /src/tmp/target/*.jar /usr/app/*.jar  
ENTRYPOINT ["java", "-jar", ,"*.jar"]
