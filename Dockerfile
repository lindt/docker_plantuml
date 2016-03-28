FROM ubuntu
MAINTAINER think@hotmail.de

RUN apt-get update && \
  apt-get install -y \
  graphviz \
  openjdk-7-jre \
  python3 python3-pip \
  wget && \
  apt-get clean

RUN wget 'http://downloads.sourceforge.net/project/plantuml/plantuml.8037.jar?r=http%3A%2F%2Fplantuml.com%2Fdownload.html&ts=1459166895&use_mirror=jaist' -O plantuml.jar

ENTRYPOINT ["java", "-jar", "plantuml.jar", "-p"]
CMD ["-tsvg"]
