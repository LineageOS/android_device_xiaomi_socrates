#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8550-common
TARGET_HAS_UDFPS := true
$(call inherit-product, device/xiaomi/sm8550-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/socrates/socrates-vendor.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths_kalama_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/mixer_paths_kalama_mtp.xml \
    $(LOCAL_PATH)/configs/audio/resourcemanager_kalama_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/resourcemanager_kalama_mtp.xml

# Overlay
PRODUCT_PACKAGES += \
    FrameworkResOverlaySocrates \
    SettingsOverlaySocrates \
    SettingsProviderOverlaySocrates \
    SystemUIOverlaySocrates

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
