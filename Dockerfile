# syntax=docker/dockerfile:1

# FROM eclipse-temurin:17-jdk-jammy as builder

# WORKDIR /opt/app
# COPY .mvn/ .mvn
# COPY mvnw pom.xml ./
# # RUN ./mvnw dependency:go-offline
# COPY ./src ./src
# RUN ./mvnw clean install

FROM eclipse-temurin:17-jre-jammy
 
 
LABEL name="spring-pet-clinic" \
      description="Docker image for spring pet clinic" 
RUN addgroup appadmin; adduser  --ingroup appadmin --disabled-password appadmin
USER appadmin
WORKDIR /opt/app
EXPOSE 80
COPY target/*.jar /opt/app/spring-petclinic.jar
#COPY --from=builder /opt/app/target/spring-petclinic.jar /opt/app/spring-petclinic.jar
ENTRYPOINT ["java", "-jar", "/opt/app/spring-petclinic.jar" ]
