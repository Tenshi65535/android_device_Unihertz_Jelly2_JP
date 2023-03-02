#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from Jelly2 device
$(call inherit-product-if-exists, vendor/Unihertz/Jelly2_JP/Jelly2_JP-vendor.mk)
$(call inherit-product, device/Unihertz/Jelly2/deviceCommon.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_Jelly2_JP
PRODUCT_DEVICE := Jelly2_JP
PRODUCT_BRAND := Unihertz
PRODUCT_MODEL := Jelly2
PRODUCT_MANUFACTURER := Unihertz

PRODUCT_AAPT_CONFIG := hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# Stock build info
BUILD_FINGERPRINT := "Unihertz/Jelly2_JP/Jelly2_JP:11/RP1A.200720.011/root.20220119.191150:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=Jelly2_JP \
    PRODUCT_NAME=Jelly2 \
    PRIVATE_BUILD_DESC="Jelly2-user 11 RP1A.200720.011 root.20220119.191150 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-unihertz