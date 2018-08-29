#!/usr/bin/env bash

echo "执行统一停止脚本...";

if [ -f "/export/servers/script/stop.sh" ]; then
	echo "发现自定义停止脚本...";
	sh /export/servers/script/stop.sh &
fi	