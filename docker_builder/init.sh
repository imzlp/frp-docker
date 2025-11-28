#!/bin/sh

MODE=${MODE:-frpc}
ARCH=${ARCH:-amd64}

PROGRAM="/usr/local/bin/frp/$ARCH/$MODE"
CONFIG_FILE="/etc/frp/$MODE.toml"

echo "Starting FRP($MODE $ARCH)..."

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file $CONFIG_FILE not found!"
    exit 1
fi

# 启动 frp
exec $PROGRAM -c $CONFIG_FILE
