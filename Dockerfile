FROM      frodenas/neo4j:2.1
MAINTAINER Alexander De Leon <me@alexdeleon.name>

# Exposes ports
EXPOSE 7474
EXPOSE 1337

# Expose our data volumes
VOLUME ["/data"]


ADD http://maven.alexdeleon.name.s3.amazonaws.com/snapshot/io-informatics/neo4j-rdf-plugin/1.0/neo4j-rdf-plugin-1.0.zip /tmp/neo4j-rdf-plugin-1.0.zip
RUN ["/bin/bash", "-c", "unzip /tmp/neo4j-rdf-plugin-1.0.zip -d /neo4j/plugins/rdf-plugin"]
RUN ["/bin/bash", "-c", "echo 'org.neo4j.server.thirdparty_jaxrs_classes=ioinformatics.neo4j.rdf.plugin=/rdf' >> /neo4j/conf/neo4j-server.properties"]


workdir /

## entrypoint
cmd ["/bin/bash", "-c", "/scripts/run.sh"]
