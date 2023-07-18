#!/bin/sh
# 使用脚本
# sh distribute.sh xx.xx.xx
# 例如；
# sh distribute.sh 1.2.5

cd "$( dirname "${BASH_SOURCE[0]}" )"

# config

# spece 发布的路径 支持相对路径和绝对路径
# 如：/Users/path/KSIT-project/specs/Business
# specsPath="../specs/Business" 

if [ -n "$1" ]
then

    for libName in Business BusinessIMTX TXIMSDK_TUIKit_iOS
    do

        podspecFileName=""${libName}".podspec"
        sh ./modify_version.sh ${podspecFileName} "$1"

    done

    sh ./distribute_new_version.sh "$1"

# # 修改podspec版本号

#     cat ${podspecFileName} | grep -e 's.version\s' | sed -ie "s/\('\([0-9]\{1,2\}.\)\{2\}[0-9]\{1,2\}'\)/'$1'/" ${podspecFileName}
#     echo "change version to '$1'"
    
# # git打tag并上传
#     git add $podspecFileName
#     git commit -m "commit new version -> '$1'"
#     git tag $1
#     git push origin master --tags
#     echo "committed and tagged v$1"

# # 发布私有库
# # 忽略警告
#     # pod repo push ks-it-kmspecs KMLib.podspec --allow-warnings
#     # echo "已发布,KMLib v$1"

#     # 移动本地的 spec git
#     mkdir -p "${specsPath}/$1" && cp "./"${podspecFileName}"" $_/${podspecFileName} && cd ${specsPath}

#     echo $pwd

#     git add $1/
#     git commit -m "[Update] "${libName}" ($1)"

#     git pull origin master
#     git push origin master
#     git status

#     echo "已发布,"${libName}" v$1"

else
    echo "请在脚本后添加版本号，如: $ sh distribute.sh 1.2.3"
fi
