zabbix�����Զ����ֹ�����jmv����
���hadoop����ʾ����
zabbix3.2.4
����template
�������
zabbix_agentd.conf
```
Include=/etc/zabbix/zabbix_agentd.d/*.conf
```
shell�ű��Ŷ�Ӧ
```
zabbix_agentd.d/zb_java_discovery.conf
UserParameter=javaps,/etc/zabbix/scripts/zbx_java_discovery.sh
```
�޸�zabbix�û�sudoȨ��
```
 cat /etc/sudoers | grep zabbi
zabbix  ALL=(ALL)       NOPASSWD:/opt/jdk/jdk1.7.0_76/bin/jps
```
����zabbixagent
��zabbixagent���Բ鿴UserParameter��ȡ����
```
/usr/local/zabbix2.4.7/sbin/zabbix_agentd -t javaps 
/usr/local/zabbix3.2.4/bin/zabbix_get  -s 192.168.1.22 -p 10050 -k javaps ��server�˻�ȡUserParameter����
{"data":[
{"{#JAVAPSNAME}":"org.apache.hadoop.hdfs.server.namenode.NameNode","{#JAVAPSPID}":"2798"}
,{"{#JAVAPSNAME}":"org.apache.hadoop.hdfs.qjournal.server.JournalNode","{#JAVAPSPID}":"3056"}
,{"{#JAVAPSNAME}":"org.apache.zookeeper.server.quorum.QuorumPeerMain","{#JAVAPSPID}":"3360"}
,{"{#JAVAPSNAME}":"org.apache.hadoop.hdfs.tools.DFSZKFailoverController","{#JAVAPSPID}":"3231"}
]}
/usr/local/zabbix3.2.4/bin/zabbix_get  -s 192.168.200.66 -p 10050 -k  proc.num[,,,org.apache.zookeeper.server.quorum.QuorumPeerMain] 
```
