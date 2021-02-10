#  Redis学习笔记

Redis is short for `Remote Dictionary Server`. 是一种远程内存数据库软件, 支持持久化和分布式集群部署.

## 安装与配置

## 客户端登录
* 使用redis-cli登录, 默认端口6379

* 设置密码

```shell
requirepass 123456
```

* 登录

```shell
auth 123456
```

## 常用数据库操作

清空数据库

```shell
flushdb
flushall
```

## 五大常用数据类型

### 1. String

### 2. List

### 3. Set

### 4. Hash

### 5. ZSet 排序集合

## 三种特殊类型数据

### 1. geospatial 地理空间

### 2. Hyperloglog 基数统计

### 3. Bitmap 位图

## 持久化

Redis有两种持久化方式: 快照模式(RDB)和追加文件模式(AOF):

### 1. RDB

#### 工作原理

* Redis调用fork()，产生一个子进程。
* 子进程把数据写到一个临时的RDB文件。
* 当子进程写完新的RDB文件后，把旧的RDB文件替换掉。

### 2. AOF

#### 工作原理

每当Redis接受到会修改数据集的命令时，就会把命令追加到AOF文件里，当你重启Redis时，AOF里的命令会被重新执行一次，重建数据。

## 集群部署

### 主从复制

### 哨兵模式

## FAQ

数据穿透, 数据击穿, 数据雪崩, 何解?











