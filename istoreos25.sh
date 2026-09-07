#!/bin/bash
set -e

mkdir -p openwrt
mkdir -p output

OUTPUT_PATH="openwrt/istoreos-25.12.5.img.gz"

echo "正在下载 istoreos‑25.12.5.img.gz"
wget -v --max-redirect=10 "https://file.tangzhiguo.cn/istoreos-25.12.5.img.gz" -O "${OUTPUT_PATH}"

if [[ $? -eq 0 ]]; then
  echo "下载istoreos成功!"
  echo "正在解压为:istoreos-25.12.5.img"
  gzip -d "${OUTPUT_PATH}"
  ls -lh openwrt/
  echo "准备合成 istoreos 安装器ISO"
  chmod +x supportFiles/istoreos/build.sh
else
  echo "下载失败！"
  exit 1
fi

# docker构建安装镜像
docker run --privileged --rm \
        -v $(pwd)/output:/output \
        -v $(pwd)/supportFiles:/supportFiles:ro \
        -v $(pwd)/openwrt/istoreos-25.12.5.img:/mnt/istoreos-25.12.5.img \
        debian:buster \
        /supportFiles/istoreos/build.sh
