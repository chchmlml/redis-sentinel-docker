# redis-sentinel-docker

## 简述
自己做的哨兵redis启动docker，配置模式为：

两哨兵、一主两从

```yaml

  master:
    ports:
      - "6379:6379"
  slave1:
    ports:
      - "6380:6379"
  slave2:
    ports:
      - "6381:6379"
  sentinel1:
    ports:
      - 26379:26379
  sentinel2:
    ports:
      - 26380:26379
      
```

哨兵配置目录在 /sentinel下面


## 安装步骤

- 1、sentinel.conf.tmpl模板修改，修改IP、密码设置等等；
- 2、执行 redis-sentinel-config.sh
```shell script
chmod a+x redis-cluster-config.sh
./redis-cluster-config.sh
```

后面会自动启动创建redis哨兵节点。
