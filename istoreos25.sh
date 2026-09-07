#!/bin/bash
FIRMWARE_URL="https://file.tangzhiguo.cn/istoreos-25.12.5.img.gz"

# 调试：下载文件，打印返回信息
wget -v --max-redirect=10 "${FIRMWARE_URL}" -O test_download.bin
echo "==== 文件大小 ===="
ls -lh test_download.bin
echo "==== 文件类型识别 ===="
file test_download.bin
echo "==== 文件头部前200字节 ===="
head -c 200 test_download.bin

FIRMWARE_ARCHIVE="gz"
FIRMWARE_NAME="iStoreOS-25.12"

chmod +x ./autobuild/autobuild.sh
source ./autobuild/autobuild.sh
