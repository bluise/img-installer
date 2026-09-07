#!/bin/bash
# 直接下载，强制输出固定文件名
wget -v --max-redirect=10 "https://file.tangzhiguo.cn/istoreos-25.12.5.img.gz" -O "firmware.img.gz"

mkdir -p imm
# 不管文件名是什么，直接按gzip解压（file命令已经确认是gzip压缩数据）
gunzip -f firmware.img.gz
# 解压后得到 firmware.img
mv firmware.img imm/custom.img

ls -lh imm/

# 直接docker构建ISO
mkdir -p output
docker run --privileged --rm \
    -v $(pwd)/output:/output \
    -v $(pwd)/supportFiles:/supportFiles:ro \
    -v $(pwd)/imm/custom.img:/mnt/custom.img \
    debian:buster \
    /supportFiles/custom/build.sh
