#!/bin/sh
# 使用脚本
# sh commit-pod.sh xx.xx.xx
# 例如；
# sh commit-pod.sh 3.2.1

cd "$( dirname "${BASH_SOURCE[0]}" )"

if [ -n "$1" ]
then
# 修改podspec版本号

    cat replace-pod-name.podspec | grep -e 's.version\s' | sed -ie "s/\('\([0-9]\{1,2\}.\)\{2\}[0-9]\{1,2\}'\)/'$1'/" replace-pod-name.podspec
    echo "change version to '$1'"
    
# git打tag并上传
    git add replace-pod-name.podspec
    git commit -m "commit new version -> '$1'"
    git tag $1
    git push origin master --tags
    echo "committed and tagged v$1"

# 发布私有库
# 忽略警告
    # pod repo push specs replace-pod-name.podspec --allow-warnings

    # 移动本地的 spec git
    mkdir -p ../zeek-specs/replace-pod-name/$1 && cp ./replace-pod-name.podspec $_/replace-pod-name.podspec && cd ../zeek-specs/replace-pod-name

    echo $pwd

    git add $1/
    git commit -m "[Update] replace-pod-name ('$1')"
    git push origin master
    git status

    echo "已发布,replace-pod-name v$1"

else
    echo "请在脚本后添加版本号，如: $ sh commit-pod.sh 3.2.1"
fi
