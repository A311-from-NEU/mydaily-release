#!/bin/bash

# 定义.deb包的下载URL
DEB_PACKAGE_URL="https://github.com/A311-from-NEU/mydaily-release/raw/main/mydaily.deb"
DEB_PACKAGE_NAME="mydaily.deb"

# 下载 .deb 包
echo "正在下载 mydaily..."
wget "$DEB_PACKAGE_URL" -O "$DEB_PACKAGE_NAME"

# 检查下载是否成功
if [ ! -f "$DEB_PACKAGE_NAME" ]; then
    echo "下载失败，请检查 URL 或网络连接。"
    exit 1
fi

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
sudo dpkg -i "$DEB_PACKAGE_NAME"

# 检查软件包是否成功安装
if [[ $? -ne 0 ]]; then
    echo "安装 mydaily 时发生错误。尝试运行 'sudo apt-get -f install' 来解决依赖问题。"
    exit 1
else
    echo "mydaily 安装成功！"
fi

exit 0
