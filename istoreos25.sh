#!/bin/bash
FIRMWARE_URL="https://fw0.koolcenter.com/iStoreOS/alpha/25.12/x86_64-efi/iStoreOS-25.12.5-2026082723-x86-64-squashfs-combined-efi.img.gz"
FIRMWARE_ARCHIVE="gz"
FIRMWARE_NAME="iStoreOS-25.12"
chmod +x ./autobuild/autobuild.sh
source ./autobuild/autobuild.sh
