FROM openjdk:14-jdk-alpine3.10
MAINTAINER think@hotmail.de
ENV PLANTUML_VERSION=1.2020.19
ENV LANG en_US.UTF-8
RUN \
  apk add --no-cache graphviz wget ca-certificates && \
  apk add --no-cache graphviz wget ca-certificates ttf-dejavu fontconfig && \
  wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
  apk del wget ca-certificates
RUN ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-version"]
RUN ["dot", "-version"]
ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar"]
CMD ["-tsvg", "-pipe"]
