FROM ubuntu:latest:168.8081/openjdk:8-jdk
WORKDIR /app
ADD target/*jar /app.jar
EXPOSE 8080

LABEL authors="Admin"

ENTRYPOINT ["top", "-b"]