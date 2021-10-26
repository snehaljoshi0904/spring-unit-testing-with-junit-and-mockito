FROM --platform=linux/arm64 openjdk:8u265-jre-slim-buster 
COPY target/solution-assetvalidator-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java","-jar","solution-assetvalidator-0.0.1-SNAPSHOT.jar"]
