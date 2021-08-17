#!/bin/sh

HERE=$(cd $(dirname "$0"); pwd)

source "$HERE/common.sh"

local_ip=""
getIpAddr

echo "\033[036m -->获取ip（mac本地） ${local_ip} \033[0m"
export LOCAL_IP=${local_ip}


echo "\033[036m --清理工作 \033[0m"
sudo docker-compose stop
rm -rf ./sentinel/sentinel.conf;

envsubst '${LOCAL_IP}' < ./sentinel.conf.tmpl > ./sentinel/sentinel.conf;

echo "\033[036m -->开始启动docker \033[0m"
sudo docker-compose up -d

echo "\033[036m -->完成 \033[0m"

echo "\033[036m -->使用时替换配置为：\"${local_ip}:26379,${local_ip}:26380\" 即可。 \033[0m"