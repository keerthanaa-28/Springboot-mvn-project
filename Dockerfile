FROM maven:3.9.9-openjdk-21  
WORKDIR /app
COPY . .  
RUN mvn clean package -DskipTests  
EXPOSE 8080  
ENTRYPOINT ["java", "-jar", "target/springboot-mvn-project.jar"]
