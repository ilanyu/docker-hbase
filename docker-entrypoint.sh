#!/bin/bash

if [ ! -f ~/.ssh/authorized_keys ]; then
	mkdir ~/.ssh/ && \
	cd ~/.ssh/ && \
	ssh-keygen -t rsa
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
fi

/etc/init.d/ssh start

if [ -z "$JAVA_HOME" ]; then
	echo 'export JAVA_HOME=/usr/local/jdk1.8.0_161' > /etc/profile.d/java.sh
	echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile.d/java.sh
	source /etc/profile.d/java.sh
fi

if [ -z "$HADOOP_HOME" ]; then
	echo 'export HADOOP_HOME=/usr/local/hadoop-2.7.4' > /etc/profile.d/hadoop.sh
	echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> /etc/profile.d/hadoop.sh
	source /etc/profile.d/hadoop.sh
fi

if [ -z "$HADOOP_COMMON_LIB_NATIVE_DIR" ]; then
	echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native' >> /etc/profile.d/hadoop.sh
	source /etc/profile.d/hadoop.sh
fi

if [ -z "$HBASE_HOME" ]; then
	echo 'export HBASE_HOME=/usr/local/hbase-1.2.6' > /etc/profile.d/hbase.sh
	echo 'export PATH=$PATH:$HBASE_HOME/bin' >> /etc/profile.d/hbase.sh
	source /etc/profile.d/hbase.sh
fi

ssh localhost && exit

start-dfs.sh
start-hbase.sh

exec "$@"
