## Use an official OpenJDK runtime as a parent image
#FROM openjdk:17
#
## Set the working directory in the container
#WORKDIR /app
#
## Copy the local jar file to the container
#COPY target/myhackathonapp-0.0.1-SNAPSHOT.jar myhackathonapp-0.0.1-SNAPSHOT.jar
#
## Run the jar file
#ENTRYPOINT ["java", "-jar", "myhackathonapp-0.0.1-SNAPSHOT.jar"]
##
##FROM java:8
##WORKDIR /
##ADD HelloWorld.jar HelloWorld.jar
##EXPOSE 8080
##CMD java - jar HelloWorld.jar

FROM java:corretto17 AS build
#Install git
RUN apk add --no-cache git
#Get the hello world package from a GitHub repository
RUN go get https://github.com/ganga22grace/hackathonrepo.git
WORKDIR /go/src/github.com/ganga22grace/hackathonrepo/tree/main
# Build the project and send the output to /bin/HelloWorld
RUN go build -o /bin/myhackathonapp

FROM java:corretto17
#Copy the build's output binary from the previous build container
COPY --from=build /bin/myhackathonapp /bin/myhackathonapp
ENTRYPOINT ["/bin/myhackathonapp"]
