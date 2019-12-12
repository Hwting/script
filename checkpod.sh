#!/bin/bash
#20190823 统计pod内存排序，统计前5 大于300重启
LOG_FILE="/var/log/checkpod-eme.log"
 for podname in `kubectl  top pod -n prod | grep -w sxs-web-dm | sort -k 3 -rn | head -n 5| awk '{if($3>400Mi) print $1}'` 
 do    
 	kubectl delete pod $podname -n prod >> $LOG_FILE
	sleep 10
done
