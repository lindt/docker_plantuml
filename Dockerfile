ARG JDK_VERSION=14-jdk-alpine3.10
FROM openjdk:${JDK_VERSION}
MAINTAINER think@hotmail.de
ARG PLANTUML_VERSION_BUILD=1.2020.9
ARG LOCALE_BUILD=en_US.UTF-8
ENV PLANTUML_VERSION=${PLANTUML_VERSION_BUILD}
ENV LANG ${LOCALE_BUILD}
RUN \
  apk add --no-cache graphviz wget ca-certificates && \
  apk add --no-cache graphviz wget ca-certificates ttf-dejavu fontconfig && \
  wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION_BUILD}/plantuml.${PLANTUML_VERSION_BUILD}.jar" -O plantuml.jar && \
  apk del wget ca-certificates
RUN ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-version"]
RUN ["dot", "-version"]
ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]
CMD ["-tsvg"]
