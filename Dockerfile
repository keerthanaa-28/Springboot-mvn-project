# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-21 AS builder  

WORKDIR /app
COPY . .  
RUN mvn clean package -DskipTests  

# Stage 2: Create a lightweight runtime image
FROM openjdk:21-runtime  

WORKDIR /app
COPY --from=builder /app/target/springboot-mvn-project.jar app.jar  

EXPOSE 8080  
ENTRYPOINT ["java", "-jar", "app.jar"]
