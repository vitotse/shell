# shell

收集了一些脚本

## 创建推送证书

make_pem.sh
在钥匙串导出推送证书的key.p12和cert.p12,生成服务器需要的pem文件

## 发布 Cocoapods 部署脚本

### 功能点：
- 修改私有有库的版本号，支持同一个 git 的多个 spec文件。
- 复制私有库的 spec 文件到 spec 仓库，并打 tag 和上传到 git。

### 使用：

1. 修改脚本的私有库名字。
2. 终端中输入
```sh distribute.sh 1.2.3```

### TODO

- [ ] 使用填入私有库名字
- [ ] 配置 git 私有地址