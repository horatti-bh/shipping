FROM      maven AS builder
RUN       mkdir /app
WORKDIR   /app
COPY      src src
COPY      pom.xml .
RUN       mvn package

FROM      openjdk:8-slim
COPY      --from=builder  /app/target/*dependencies.jar shipping.jar
CMD       java -jar shipping.jar
