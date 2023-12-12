#!/bin/bash

# 定义.deb包的路径
DEB_PACKAGE="mydaily.deb"

# 更新软件包列表
echo "正在更新软件包列表..."
sudo apt-get update

# 安装依赖
echo "正在安装依赖..."
sudo apt-get install -y libc6 libqt5core5a libqt5gui5 libqt5widgets5 libqt5sql5

# 检查依赖是否成功安装
if [[ $? -ne 0 ]]; then
    echo "安装依赖时发生错误。"
    exit 1
else
    echo "所有依赖已成功安装。"
fi

# 安装 .deb 包
echo "正在安装 mydaily..."
sudo dpkg -i "$DEB_PACKAGE"

# 检查软件包是否成功安装
if [[ $? -ne 0 ]]; then
    echo "安装 mydaily 时发生错误。尝试运行 'sudo apt-get -f install' 来解决依赖问题。"
    exit 1
else
    echo "mydaily 安装成功！"
fi

exit 0
