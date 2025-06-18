#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/socrates

# Inherit from sm8550-common
include device/xiaomi/sm8550-common/BoardConfigCommon.mk

# Kernel
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    wl2866d.ko \
    xiaomi_touch.ko \
    goodix_core.ko \
    goodix_fod.ko

# Power
TARGET_TAP_TO_WAKE_NODE := /sys/devices/platform/goodix_ts.0/double_tap_enable

# System properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Vibrator
TARGET_QTI_VIBRATOR_EFFECT_LIB := libqtivibratoreffect.xiaomi
TARGET_QTI_VIBRATOR_USE_EFFECT_STREAM := true

include vendor/xiaomi/socrates/BoardConfigVendor.mk
