FROM ubuntu:16.04

MAINTAINER ilanyu <lanyu19950316@gmail.com>

RUN apt update && apt install -y wget vim tar bash openssh-server

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -N http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz && \
    wget https://archive.apache.org/dist/hbase/1.2.6/hbase-1.2.6-bin.tar.gz && \
    wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.4/hadoop-2.7.4.tar.gz && \
    tar -zxvf jdk-8u161-linux-x64.tar.gz -C /usr/local/ && \
    tar -zxvf hadoop-2.7.4.tar.gz -C /usr/local/ && \
    tar -zxvf hbase-1.2.6-bin.tar.gz -C /usr/local/ && \
    rm -rf jdk-8u161-linux-x64.tar.gz && \
    rm -rf hadoop-2.7.4.tar.gz && \
    rm -rf hbase-1.2.6-bin.tar.gz

COPY hadoop/core-site.xml /usr/local/hadoop-2.7.4/etc/hadoop/core-site.xml

COPY hadoop/hdfs-site.xml /usr/local/hadoop-2.7.4/etc/hadoop/hdfs-site.xml

COPY hbase-env.sh /usr/local/hbase-1.2.6/conf/hbase-env.sh

COPY hbase-site.xml /usr/local/hbase-1.2.6/conf/hbase-site.xml

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]
