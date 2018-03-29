# docker-hbase

hbase docker image for cuit' hbase course

### Use:

	sudo apt install -y screen
	curl -sSL https://get.daocloud.io/docker | sh
	docker pull ilanyu/hbase
	screen docker run -it -p 9000:9000 -p 50090:50090 -p 50070:50070 -p 50010:50010 -p 50075:50075 -p 40316:40316 -p 50020:50020 -p 16010:16010 -p 16020:16020 -p 16030:16030 -p 16000:16000 -p 2181:2181 ilanyu/hbase
	hbase shell


