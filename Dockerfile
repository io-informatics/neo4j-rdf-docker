FROM      tpires/neo4j
MAINTAINER Alexander De Leon <me@alexdeleon.name>

# Exposes ports
EXPOSE 7474
EXPOSE 1337

# Expose our data volumes
VOLUME ["/data"]


ADD http://maven.alexdeleon.name.s3.amazonaws.com/snapshot/io-informatics/neo4j-rdf-plugin/1.1/neo4j-rdf-plugin-1.1.zip /tmp/neo4j-rdf-plugin-1.1.zip
RUN ["/bin/bash", "-c", "unzip /tmp/neo4j-rdf-plugin-1.1.zip -d /var/lib/neo4j/plugins/rdf-plugin"]
RUN ["/bin/bash", "-c", "echo 'org.neo4j.server.thirdparty_jaxrs_classes=ioinformatics.neo4j.rdf.plugin=/rdf' >> /var/lib/neo4j/conf/neo4j-server.properties"]


workdir /

## entrypoint
cmd ["/bin/bash", "-c", "/launch.sh"]
