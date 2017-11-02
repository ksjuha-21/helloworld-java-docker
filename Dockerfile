FROM tomcat:alpine

MAINTAINER Oksana Severovostokova <severovostokova@gmail.com>

RUN apk update
RUN apk add git

RUN git clone https://github.com/ksjuha-21/helloworld-java-docker.git

WORKDIR helloworld-java-docker

RUN [ "chmod", "+x", "./gradlew" ]
RUN [ "./gradlew", "war" ]

RUN cp build/libs/helloworld-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/helloworld.war

CMD ["catalina.sh", "run"]
