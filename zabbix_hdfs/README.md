zabbix配置自动发现规则监控jmv进程
监控hadoop进程示例：
zabbix3.2.4
导入template
添加配置
zabbix_agentd.conf
```
Include=/etc/zabbix/zabbix_agentd.d/*.conf
UnsafeUserParameters=1
```
在zabbix_agentd.conf中添加相关的key shell脚本放对应
```
zabbix_agentd.d/zb_java_discovery.conf
UserParameter=javaps,/etc/zabbix/scripts/zbx_java_discovery.sh
```
修改zabbix用户sudo权限
```
 cat /etc/sudoers | grep zabbi
zabbix  ALL=(ALL)       NOPASSWD:/opt/jdk/jdk1.7.0_76/bin/jps
```
重启zabbixagent
在zabbixagent测试查看UserParameter获取数据
```
/usr/local/zabbix2.4.7/sbin/zabbix_agentd -t javaps 
/usr/local/zabbix3.2.4/bin/zabbix_get  -s 192.168.1.22 -p 10050 -k javaps 在server端获取UserParameter数据
{"data":[
{"{#JAVAPSNAME}":"org.apache.hadoop.hdfs.server.namenode.NameNode","{#JAVAPSPID}":"2798"}
,{"{#JAVAPSNAME}":"org.apache.hadoop.hdfs.qjournal.server.JournalNode","{#JAVAPSPID}":"3056"}
,{"{#JAVAPSNAME}":"org.apache.zookeeper.server.quorum.QuorumPeerMain","{#JAVAPSPID}":"3360"}
,{"{#JAVAPSNAME}":"org.apache.hadoop.hdfs.tools.DFSZKFailoverController","{#JAVAPSPID}":"3231"}
]}
/usr/local/zabbix3.2.4/bin/zabbix_get  -s 192.168.200.66 -p 10050 -k  proc.num[,,,org.apache.zookeeper.server.quorum.QuorumPeerMain] 
```
