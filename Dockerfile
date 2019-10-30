FROM openjdk:14-jdk-alpine3.10
MAINTAINER think@hotmail.de
ENV PLANTUML_VERSION=1.2019.11
RUN \
  apk add --no-cache graphviz wget ca-certificates && \
  wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
  apk del wget ca-certificates

ENV LANG en_US.UTF-8
RUN ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-version"]
ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]
CMD ["-tsvg"]
