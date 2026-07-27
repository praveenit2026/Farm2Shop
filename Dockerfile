# Stage 1: Build the Maven WAR file using Java 8
FROM maven:3.8.6-eclipse-temurin-8 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests -B

# Stage 2: Deploy WAR on Tomcat 9 with Java 8
FROM tomcat:9.0-jdk8-openjdk-slim

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT.war

# Copy built WAR as ROOT (so app runs at /)
COPY --from=build /app/target/FarmToShopWeb.war /usr/local/tomcat/webapps/ROOT.war

# Use a startup script to dynamically set the PORT from Render's environment
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 10000

CMD ["/start.sh"]
