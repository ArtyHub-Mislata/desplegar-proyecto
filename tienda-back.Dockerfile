FROM maven:3.9.11-eclipse-temurin-21-noble

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y git

WORKDIR /opt/app
RUN git clone https://github.com/ArtyHub-Mislata/tienda-back.git
WORKDIR /opt/app/tienda-back
RUN git switch --detach origin/develop
RUN mvn clean install -DskipTests

EXPOSE 8080

CMD ["java","-jar", "target/artyhub-tienda-back-0.0.1-SNAPSHOT.jar"]
