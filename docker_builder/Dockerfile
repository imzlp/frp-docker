FROM alpine:3.18

# 复制 frpc 和 frps 二进制文件
COPY frp/amd64/frpc /usr/local/bin/frp/amd64/frpc
COPY frp/amd64/frps /usr/local/bin/frp/amd64/frps

COPY frp/arm64/frpc /usr/local/bin/frp/arm64/frpc
COPY frp/arm64/frps /usr/local/bin/frp/arm64/frps

RUN chmod +x /usr/local/bin/frp/amd64/frpc /usr/local/bin/frp/amd64/frps
RUN chmod +x /usr/local/bin/frp/arm64/frpc /usr/local/bin/frp/arm64/frps

# 复制启动脚本
COPY init.sh /init.sh
RUN chmod +x /init.sh

# 创建配置文件目录
RUN mkdir -p /etc/frp

# 设置工作目录
WORKDIR /etc/frp

# 暴露常用端口
# 7000: frps 默认端口
# 7500: frps dashboard 端口
EXPOSE 7000 7500

# 设置启动脚本
ENTRYPOINT ["/init.sh"]
