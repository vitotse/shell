#!/bin/sh

# 原始路径
originPath=$0

echo "originPath:$originPath"

fileName=${originPath##*/}

last=${#fileName}
length=${#originPath}

((dis=$length-$last))

rootPath=${originPath:0:dis}

# cert和key的p12输入路径
certPath=""$rootPath"cert.p12"
keyPath=""$rootPath"key.p12"

# 输出路径
outCertPath=""$rootPath"cert.pem"
outKeyPath=""$rootPath"key.pem"
outApnsPath=""$rootPath"apns.pem"

# 导出pem
# 第三次密码是设置最后合并的pem密码
openssl pkcs12 -clcerts -nokeys -out $outCertPath -in $certPath
openssl pkcs12 -nocerts -out $outKeyPath -in $keyPath

# 合并pem
cat $outCertPath $outKeyPath > $outApnsPath
