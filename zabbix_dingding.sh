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

CURL="/usr/bin/curl"
to=$1
subject=$2
body=$3
${CURL}  'https://oapi.dingtalk.com/robot/send?access_token=XXXXXXXXX' \
   -H 'Content-Type: application/json' \
   -d """
 {
     \"msgtype\": \"markdown\",
     \"markdown\": {
         \"title\":\"${subject}@18*****5\",
         \"text\": \"${body}\"
     },
    \"at\": {
        \"atMobiles\": [ 
            \"18*****5\",
        ], 
        \"isAtAll\": false
    }
 }"""
