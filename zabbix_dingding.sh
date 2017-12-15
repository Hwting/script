#!/bin/bash
#date:2017-12-14
#by wang.t
#Revision: 1.0
# Email:
# Website:idcsec.com
LOGFILE="/tmp/dingding.log"
:>"$LOGFILE"
exec 1>"$LOGFILE"
exec 2>&1

url="http://127.0.0.1/zabbix"
CURL="/usr/bin/curl"
to=$1
subject=$2
body=$3
${CURL}  'https://oapi.dingtalk.com/robot/send?access_token=789d574d7863df023f70e4d9951f47f04828120e07403d0ac9b682774f11d8db' \
   -H 'Content-Type: application/json' \
   -d """
 {
     \"msgtype\": \"markdown\",
     \"markdown\": {
         \"title\":\"${subject}@18011583505\",
         \"text\": \"${body}\"
     },
    \"at\": {
        \"atMobiles\": [ 
            \"18011583505\",
        ], 
        \"isAtAll\": false
    }
 }"""
#{\"msgtype\": \"text\", 
#    \"text\": {
#        \"content\": "$body"\n
#     }
#  }"""
##echo $body >> /tmp/dingding.log
