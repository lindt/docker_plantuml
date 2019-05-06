FROM openjdk:8-jre-alpine

MAINTAINER think@hotmail.de

ENV PLANTUML_VERSION=1.2019.5

RUN apk add --no-cache ttf-dejavu

RUN \
  apk add --no-cache graphviz wget ca-certificates && \
  wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
  apk del wget ca-certificates

ENV LANG en_US.UTF-8

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]

CMD ["-tsvg"]
