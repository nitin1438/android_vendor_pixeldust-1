# Copyright (C) 2019-2020 The PixelDust Project
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

# Bootanimation
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := Pixel 3
export TARGET_DEVICE=blueline

# We have our own power HAL
TARGET_USES_DEVICE_SPECIFIC_POWERHAL := true

# Use the AOSP stack
TARGET_USES_AOSP := true

# Use the sepolicies which are being shipped with our device
TARGET_EXCLUDE_QCOM_VENDOR_SEPOLICY := true

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, device/google/crosshatch/aosp_blueline.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Include common PixelDust stuff
include vendor/pixeldust/configs/pixeldust_phone.mk

# Include optional stuff (e.g. prebuilt apps)
include vendor/pixeldust/configs/system_optional.mk

# Google Apps
$(call inherit-product-if-exists, vendor/googleapps/googleapps.mk)

PRODUCT_NAME := pixeldust_blueline
PRODUCT_DEVICE := blueline
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 3

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="blueline" \
    PRIVATE_BUILD_DESC="blueline-user 11 RP1A.200720.009 6720564 release-keys"

BUILD_FINGERPRINT="google/blueline/blueline:11/RP1A.200720.009/6720564:user/release-keys"
BUILD_THUMBPRINT="11/RP1A.200720.009/6720564:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pixeldust.maintainer="spezi77" \
    ro.pixeldust.device="blueline"

# Allow neverallows, to allow Smart Charging sepolicies
ifneq ($(TARGET_BUILD_VARIANT),user)
SELINUX_IGNORE_NEVERALLOWS := true
endif
