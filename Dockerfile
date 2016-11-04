FROM frolvlad/alpine-oraclejdk8

MAINTAINER think@hotmail.de

ENV PLANTUML_VERSION=8040

RUN \
  apk add --no-cache graphviz wget && \
  wget "http://downloads.sourceforge.net/project/plantuml/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
  apk del wget

ENV LANG en_US.UTF-8

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]

CMD ["-tsvg"]
