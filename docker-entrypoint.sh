#!/bin/bash

# timezone
ln -sf /usr/share/zoneinfo/${TZ:-"Asia/Shanghai"} /etc/localtime
echo ${TZ:-"Asia/Shanghai"} > /etc/timezone

# get tanzhen
wget https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
bash status.sh c << EOF
1
$IP
$PORT
$USER
$PASSWD
EOF

if [[ $IP = "127.0.0.1"]]; then
bash status << EOF
1
35601
Y
EOF
fi

tail -f status.sh