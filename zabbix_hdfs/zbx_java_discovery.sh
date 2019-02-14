#!/bin/bash
javaProcessList=`sudo -u hadoop $JAVA_HOME/bin/jps -l | grep -v Jps | grep -v Jstat | awk '{print $1"#"$2}' | grep "^[0-9]*#[a-zA-Z].*" `
echo "{\"data\":["
first=1
for javaProcess in $javaProcessList;
do
    IFS='#' read -r -a items <<< "$javaProcess";
    if [ $first == 1 ]; then
        echo "{\"{#JAVAPSNAME}\":\"${items[1]}\",\"{#JAVAPSPID}\":\"${items[0]}\"}";
        first=0
    else
        echo ",{\"{#JAVAPSNAME}\":\"${items[1]}\",\"{#JAVAPSPID}\":\"${items[0]}\"}";
    fi
done;

echo "]}";
