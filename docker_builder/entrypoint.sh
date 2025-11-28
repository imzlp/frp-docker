#!/bin/sh

# 设置默认模式为 client
MODE=${MODE:-frpc}
ARCH=${ARCH:-amd64}

# 根据模式选择执行的程序和配置文件
if [ "$MODE" = "frps" ]; then
    PROGRAM="/usr/local/bin/frp/$ARCH/frps"
    CONFIG_FILE="/etc/frp/frp/$ARCH/frps.toml"
    echo "Starting FRP Server..."
else
    PROGRAM="/usr/local/bin/frp/$ARCH/frpc"
    CONFIG_FILE="/etc/frp/frp/$ARCH/frpc.toml"
    echo "Starting FRP Client..."
fi

# 检查配置文件是否存在
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file $CONFIG_FILE not found!"
    exit 1
fi

# 启动 frp
exec $PROGRAM -c $CONFIG_FILE
