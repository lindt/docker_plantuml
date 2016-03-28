# docker_plantuml

Docker Container for [PlantUML](http://plantuml.com)

## Motivation

To use plantuml, it needs to be downloaded, java needs to be installed, graphviz needs to be installed, and these things need to be chained.
This docker container does this for you. And allows you to pipe by default into plantuml, so it's neat for script usage.

## Usage

```
cat test.uml | docker run -i think/plantuml
```

The default will output svg. If png output is wanted, call it like this:

```
cat test.uml | docker run -i think/plantuml -tpng
```
