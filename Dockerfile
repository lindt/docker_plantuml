FROM frolvlad/alpine-oraclejdk8

MAINTAINER think@hotmail.de

RUN \
  apk add --no-cache graphviz wget && \
  wget 'http://downloads.sourceforge.net/project/plantuml/plantuml.8037.jar?r=http%3A%2F%2Fplantuml.com%2Fdownload.html&ts=1459166895&use_mirror=jaist' -O plantuml.jar && \
  apk del wget

ENV LANG en_US.UTF-8

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar", "-p"]

CMD ["-tsvg"]
