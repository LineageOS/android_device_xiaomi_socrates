#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/socrates

# Inherit from sm8550-common
include device/xiaomi/sm8550-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 540

# Kernel
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    wl2866d.ko \
    xiaomi_touch.ko \
    goodix_core.ko \
    goodix_fod.ko

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD += \
    goodix_core.ko

BOOT_KERNEL_MODULES += \
    goodix_core.ko

# System properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

include vendor/xiaomi/socrates/BoardConfigVendor.mk
