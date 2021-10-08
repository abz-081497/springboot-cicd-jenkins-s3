FROM openjdk:8-jre-alpine
ARG VERSION
WORKDIR /app
COPY target/springbootrestapiexample-$VERSION.jar /app/springbootrestapiexample.jar
ENTRYPOINT ["java", "-jar", "springbootrestapiexample.jar"]
