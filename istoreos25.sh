#!/bin/bash
wget -v --max-redirect=10 "https://file.tangzhiguo.cn/istoreos-25.12.5.img.gz" -O "firmware.img.gz"

mkdir -p imm
gunzip -f firmware.img.gz
mv firmware.img imm/custom.img

ls -lh imm/

# 关键修复：给构建脚本增加可执行权限
chmod +x ./supportFiles/custom/build.sh

mkdir -p output
docker run --privileged --rm \
    -v $(pwd)/output:/output \
    -v $(pwd)/supportFiles:/supportFiles:ro \
    -v $(pwd)/imm/custom.img:/mnt/custom.img \
    debian:buster \
    /supportFiles/custom/build.sh
