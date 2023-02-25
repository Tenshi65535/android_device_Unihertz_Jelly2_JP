#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/Unihertz/Jelly2_JP

#Include GAPPS if applicable
-include $(DEVICE_PATH)/gapps_prop.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_Jelly2_JP
PRODUCT_DEVICE := Jelly2_JP
PRODUCT_BRAND := Unihertz
PRODUCT_MODEL := Jelly2
PRODUCT_MANUFACTURER := Unihertz

# Define Dynamic Partition support
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE := true

# Properties
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# A/B
AB_OTA_UPDATER := false

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

# A/B
AB_OTA_UPDATER := false

# Additional tools
PRODUCT_HOST_PACKAGES += \
    unpack_bootimg \
    lpmake   

# fstab
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6771:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6771

# NFC stack (AOSP)
PRODUCT_PACKAGES += \
    NfcNci

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

# Init
PRODUCT_PACKAGES += \
    init.mt6771.rc \
    fstab.mt6771
    
# HardwareKeyMapper
PRODUCT_PACKAGES += \
    HardwareKeyMapper    

# Keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/idc/mtk-kpd.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/mtk-kpd.idc \
    $(DEVICE_PATH)/idc/mtk-pad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/mtk-pad.idc \
    $(DEVICE_PATH)/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl \
    $(DEVICE_PATH)/keylayout/mtk-tpd-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-tpd-kpd.kl

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_stub.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration_stub.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/enginedefault/config/example/phone/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_configuration.xml \
    frameworks/av/services/audiopolicy/enginedefault/config/example/phone/audio_policy_engine_default_stream_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_default_stream_volumes.xml \
    frameworks/av/services/audiopolicy/enginedefault/config/example/phone/audio_policy_engine_product_strategies.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_product_strategies.xml \
    frameworks/av/services/audiopolicy/enginedefault/config/example/phone/audio_policy_engine_stream_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_engine_stream_volumes.xml

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/platform_unihertz.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/platform_unihertz.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-platform_unihertz.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-platform_unihertz.xml

PRODUCT_PACKAGES += \
    libbrotli \
    libhwbinder \
    libhidltransport \
    libaudioprocessing \
    libaudioflinger \
    libaudio-resampler \
    libaudiopolicyengineconfigurable \
    libaudiopolicyenginedefault \
    libsuspend \
    libsparse \
    libdrm \
    libpcap \
    libext2_blkid \
    libext2_com_err \
    libext2_e2p \
    libext2_uuid \
    libext2fs \
    libremote-processor \
    libparameter \
    libtextclassifier_hash \
    com.android.nfc_extras \
    android.hardware.audio.common-util \
    android.hardware.audio.common@2.0-util \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio.common@6.0 \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio.effect@2.0 \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio.effect@5.0 \
    android.hardware.audio.effect@6.0 \
    android.hardware.audio@2.0 \
    android.hardware.audio@4.0 \
    android.hardware.audio@5.0 \
    android.hardware.audio@6.0 \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.health@1.0 \
    android.hardware.health@2.0 \
    android.hardware.nfc@1.0 \
    android.hardware.nfc@1.1 \
    android.hardware.nfc@1.2 \
    android.hardware.radio.config@1.0 \
    android.hardware.radio.config@1.1 \
    android.hardware.radio.config@1.2 \
    android.hardware.radio@1.0 \
    android.hardware.radio@1.1 \
    android.hardware.radio@1.2 \
    android.hardware.radio@1.3 \
    android.hardware.radio@1.4 \
    android.hardware.radio@1.5 \
    android.hardware.soundtrigger@2.0 \
    android.hardware.soundtrigger@2.1 \
    android.hardware.soundtrigger@2.2

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Overlays -- replace official
PRODUCT_PACKAGES += \
    FrameworkResOverlay

# Telephony Jars
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# FeliCa
PRODUCT_COPY_FILES += \
vendor/Unihertz/Jelly2_JP/proprietary/framework/com.felicanetworks.felica.jar:system/framework/com.felicanetworks.felica.jar \
vendor/Unihertz/Jelly2_JP/proprietary/framework/com.felicanetworks.felicaextra.jar:system/framework/com.felicanetworks.felicaextra.jar \
vendor/Unihertz/Jelly2_JP/proprietary/vendor/etc/felica.cfg:vendor/etc/felica.cfg\
vendor/Unihertz/Jelly2_JP/proprietary/etc/felica_access.xml:etc/felica_access.xml\
vendor/Unihertz/Jelly2_JP/proprietary/etc/FelicaCmd.txt:etc/FelicaCmd.txt\
vendor/Unihertz/Jelly2_JP/proprietary/etc/felica/common.cfg:etc/felica/common.cfg\
vendor/Unihertz/Jelly2_JP/proprietary/etc/felica/mfm.cfg:etc/felica/mfm.cfg\
vendor/Unihertz/Jelly2_JP/proprietary/etc/felica/mfs.cfg:etc/felica/mfs.cfg\
vendor/Unihertz/Jelly2_JP/proprietary/system/app/FeliCaLock/FeliCaLock.apk:system/app/FeliCaLock/FeliCaLock.apk\
vendor/Unihertz/Jelly2_JP/proprietary/system/app/MobileFeliCaClient/MobileFeliCaClient.apk:system/app/MobileFeliCaClient/MobileFeliCaClient.apk\
vendor/Unihertz/Jelly2_JP/proprietary/system/app/MobileFeliCaMenuMainApp/MobileFeliCaMenuMainApp.apk:system/app/MobileFeliCaMenuMainApp/MobileFeliCaMenuMainApp.apk\
vendor/Unihertz/Jelly2_JP/proprietary/system/app/MobileFeliCaSettingApp/MobileFeliCaSettingApp.apk:system/app/MobileFeliCaSettingApp/MobileFeliCaSettingApp.apk\
vendor/Unihertz/Jelly2_JP/proprietary/system/app/MobileFeliCaWebPluginBoot/MobileFeliCaWebPluginBoot.apk:system/app/MobileFeliCaWebPluginBoot/MobileFeliCaWebPluginBoot.apk\
vendor/Unihertz/Jelly2_JP/proprietary/system/etc/permissions/com.felicanetworks.felica.xml:system/etc/permissions/com.felicanetworks.felica.xml\
vendor/Unihertz/Jelly2_JP/proprietary/system/etc/permissions/com.felicanetworks.felicaextra.xml:system/etc/permissions/com.felicanetworks.felicaextra.xml\
vendor/Unihertz/Jelly2_JP/proprietary/system/lib/libsony_nfc_nci_jni.so:system/lib/libsony_nfc_nci_jni.so\
vendor/Unihertz/Jelly2_JP/proprietary/system/lib/libnfc-nci.so:system/lib/libnfc-nci.so\
vendor/Unihertz/Jelly2_JP/proprietary/system/lib64/libsony_nfc_nci_jni.so:system/lib64/libsony_nfc_nci_jni.so\
vendor/Unihertz/Jelly2_JP/proprietary/system/lib64/libnfc-nci.so:system/lib64/libnfc-nci.so

#Include GAPPS if applicable 
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)