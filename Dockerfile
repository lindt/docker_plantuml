FROM frolvlad/alpine-oraclejdk8

MAINTAINER think@hotmail.de

ENV PLANTUML_VERSION=8057

RUN \
  apk add --no-cache graphviz wget ca-certificates && \
  wget "https://downloads.sourceforge.net/project/plantuml/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
  apk del wget ca-certificates

ENV LANG en_US.UTF-8

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]

CMD ["-tsvg"]
