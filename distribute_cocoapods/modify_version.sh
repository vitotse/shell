#!/bin/sh
# 使用修改版本号脚本
# 参数1: podspec 文件名
# 参数2: 版本号 如，1.2.3
#
# sh modify_version.sh xxx.podspec xx.xx.xx
# 例如；
# sh modify_version.sh ZeekBusiness.podspec 1.2.3

cd "$( dirname "${BASH_SOURCE[0]}" )"

# config

# 输入“podspec”

if [ -n "$2" ]

then
# 修改podspec版本号

    # podspec 的文件名数组
    # 替换规则：
    # 找到 s.version 那行，替换版本号

    cat $1 | sed -ie "/s.version/s/\('\([0-9]\{1,2\}.\)\{2\}[0-9]\{1,2\}'\)/'$2'/" $1


else
    echo "请在脚本后添加版本号，如: $ sh modify_version.sh ZeekBusiness.podspec 1.2.3"
fi
