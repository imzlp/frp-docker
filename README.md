
## Uasge

导入镜像：

```bash
# docker load -o prebuild/frp-0.65.0.tar
# docker images -a
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
frp          0.65.0   983b02d2f8d6   17 hours ago    81.3MB
```

从镜像创建容器：

支持两个参数：
- `MODE`：frpc或frps
- `ARCH`：amd64或arm64

注意：为了可以转发本地所有端口，请在`docker run`时指定`--network host`。

### 启动frpc

```bash
# frpc
docker run -d \
  --name frpc \
  --network host \
  --restart=always \
  -e MODE=frpc \
  -e ARCH=amd64 \
  -v /home/root/frp/frpc.toml:/etc/frp/frpc.toml \
  frp:0.65.0
```

### 启动frps

```bash
docker run -d \
  --name frps \
  --network host \
  --restart=always \
  -e MODE=frpc \
  -e ARCH=amd64 \
  -v /home/root/frp/frps.toml:/etc/frp/frps.toml \
  frp:0.65.0
  ```
