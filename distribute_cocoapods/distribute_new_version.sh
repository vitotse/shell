#!/bin/sh
SPEC_Business="Business"
SPEC_BusinessIMTX="BusinessIMTX"
SPEC_TXIMSDK_TUIKit_iOS="TXIMSDK_TUIKit_iOS"
SpecsRepoPath="../specs-ios"

if [ -n "$1" ]
then
    
    # 打tag
    git add "${SPEC_Business}.podspec"
    git add "${SPEC_BusinessIMTX}.podspec"
    git add "${SPEC_TXIMSDK_TUIKit_iOS}.podspec"
    git commit -m "commit new version -> '$1'"
    git tag $1
    git push origin master --tags
    echo "committed and tagged v$1"
    
    # 复制spec文件到spec项目里
    mkdir -p "${SpecsRepoPath}/${SPEC_Business}/$1/"
    mkdir -p "${SpecsRepoPath}/${SPEC_BusinessIMTX}/$1/"
    mkdir -p "${SpecsRepoPath}/${SPEC_TXIMSDK_TUIKit_iOS}/$1/"
    cp "${SPEC_Business}.podspec" "${SpecsRepoPath}/${SPEC_Business}/$1/"
    cp "${SPEC_BusinessIMTX}.podspec" "${SpecsRepoPath}/${SPEC_BusinessIMTX}/$1/"
    cp "${SPEC_TXIMSDK_TUIKit_iOS}.podspec" "${SpecsRepoPath}/${SPEC_TXIMSDK_TUIKit_iOS}/$1/"
    
    # 提交spec项目
    cd ${SpecsRepoPath}
    
    git add .
    git commit -m "[Update] "${SPEC_Business}" ($1)"
    git pull origin master
    git push origin master
    
    echo "已发布,"${SPEC_Business}" v$1"

else
    echo "请在脚本后添加版本号，如: $ sh distribute_new_version.sh 1.2.3"
fi
