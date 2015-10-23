# Copyright (C) 2015 The Android Open Source Project 
#    & The Exodus Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/exodus/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including exodus part
TARGET_BOOTANIMATION_SIZE := 1080x720

# Inherit from our custom product configuration
$(call inherit-product, vendor/exodus/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/bacon/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := exodus_bacon
PRODUCT_DEVICE := bacon
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := A0001
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_PRODUCT=exodus \
    TARGET_DEVICE=A0001 \
    BUILD_FINGERPRINT="4.3/JLS36C/1390465867:user/release-keys" \
    PRIVATE_BUILD_DESC="msm8974-user 4.3 JLS36C eng.root.20140510.152835 release-keys"

# Inline kernel
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8974
TARGET_KERNEL_CONFIG := msm8974_exodus_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin

# Inherit from proprietary blobs
$(call inherit-product, vendor/oppo/find7a/find7a-vendor.mk)

