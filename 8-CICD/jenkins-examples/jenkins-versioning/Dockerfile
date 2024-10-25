FROM amazoncorretto:8-alpine3.17-jre

EXPOSE 8080

COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app

# Entrypoint won't work with * and must use shell command, so use CMD
# ENTRYPOINT ["java", "-jar", "java-maven-app-*.jar"]
CMD java -jar java-maven-app-*.jar
