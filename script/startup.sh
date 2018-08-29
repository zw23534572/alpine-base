#!/usr/bin/env bash

echo "执行统一启动脚本...";

if [ -z $env ];then
    export env='dev'
fi

if [ -f "/export/servers/script/start.sh" ]; then
	echo "发现自定义启动脚本...";
	sh /export/servers/script/start.sh &
fi	