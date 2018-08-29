#!/usr/bin/env bash

# rc-service crond start > /dev/null 2>&1
#启动脚本
sh /export/servers/script/startup.sh > /export/logs/startup.log 2>&1 &
tail -f /export/logs/*.log

#监听停止事件
trap 'sh /export/servers/script/shutdown.sh' 15;

wait $!