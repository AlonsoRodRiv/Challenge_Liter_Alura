FROM maven:4.0.0-openjdk-17 AS build
WORKDIR /app
COPY . /app/
RUN mvn clean package


FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar","app.jar"]