#!/bin/ash

if [ -z "$JAVA_HOME" ]; then
	export JAVA_HOME=/usr/local/jdk1.8.0_161
	export PATH=$PATH:$JAVA_HOME/bin
fi

if [ -z "$HADOOP_HOME" ]; then
	export HADOOP_HOME=/usr/local/hadoop-2.7.4
	export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
fi

if [ -z "$HADOOP_COMMON_LIB_NATIVE_DIR" ]; then
	export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
fi

if [ -z "$HBASE_HOME" ]; then
	export HBASE_HOME=/usr/local/hbase-1.2.6
	export PATH=$PATH:$HBASE_HOME/bin
fi

if [ ! -f ~/.ssh/authorized_keys ]; then
	cd ~/.ssh/ && \
	ssh-keygen -t rsa && \
	cat ./id_rsa.pub >> ./authorized_keys && \
fi

ssh localhost

start-dfs.sh
start-hbase.sh

exec "$@"
