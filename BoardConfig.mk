# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

-include device/Unihertz/Jelly2/BoardConfigCommon.mk

DEVICE_PATH := device/Unihertz/Jelly2_JP

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/boot/Image.gz
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb