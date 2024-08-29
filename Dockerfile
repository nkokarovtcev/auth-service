FROM openjdk:21 AS build
WORKDIR /app
COPY . .
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

FROM openjdk:21
COPY --from=build /app/target/auth-service*.jar /usr/local/lib/auth-service.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/auth-service.jar"]