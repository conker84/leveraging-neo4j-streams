FROM apache/zeppelin:0.8.0

# Workaround to "fix" https://issues.apache.org/jira/browse/ZEPPELIN-3586

RUN echo "Download Spark binary" && \
    wget -O /tmp/spark-2.3.1-bin-hadoop2.7.tgz http://apache.panu.it/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz && \
    tar -zxvf /tmp/spark-2.3.1-bin-hadoop2.7.tgz && \
    rm -rf /tmp/spark-2.3.1-bin-hadoop2.7.tgz && \
    mv spark-2.3.1-bin-hadoop2.7 /spark-2.3.1-bin-hadoop2.7

ENV SPARK_HOME=/spark-2.3.1-bin-hadoop2.7

# ARG MAVEN_VERSION=3.5.4
# ARG SHA=ce50b1c91364cb77efe3776f756a6d92b76d9038b0a0782f7d53acf1e997a14d
# ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

# RUN echo "Download Maven binary" && \
# 	mkdir -p /usr/share/maven /usr/share/maven/ref && \
# 	curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
# 	echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - && \
# 	tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 && \
# 	rm -f /tmp/apache-maven.tar.gz && \
#	ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

#RUN echo "Download and Install CAPS" && \
#	git clone https://github.com/opencypher/cypher-for-apache-spark.git /cypher-for-apache-spark && \
#	cd /cypher-for-apache-spark && \
#	mvn clean install -DskipTests

CMD ["bin/zeppelin.sh"]