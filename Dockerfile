FROM openjdk:21-jdk-slim
WORKDIR /app
COPY target/MiniInstagram-0.0.1-SNAPSHOT.jar MiniInstagram.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "MiniInstagram.jar"]