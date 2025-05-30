# Stage 1: Build the application using Maven
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .  
RUN mvn clean package -DskipTests  
RUN ls -l /app/target/

# Stage 2: Create a lightweight runtime image
FROM eclipse-temurin:21-jre  
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar  
EXPOSE 8080  
ENTRYPOINT ["java", "-jar", "app.jar"]
