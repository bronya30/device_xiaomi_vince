#
# Copyright (C) 2017 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from vince device
$(call inherit-product, device/xiaomi/vince/device.mk)

# Inherit some common Alphadroid stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Include Alphadroid specific sepolicy
-include device/lineage/sepolicy/qcom/sepolicy.mk

# Build Maintainer
ALPHA_MAINTAINER := GhostMaster69-dev

ifneq ($(TARGET_WITH_GAPPS), false)
# Full Gapps
WITH_GAPPS := 2

# Google telephony
TARGET_USE_GOOGLE_TELEPHONY := true

# Google NGA
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true

# Remove Gapps packages
PRODUCT_PACKAGES += RemovePackages
endif

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := xiaomi
PRODUCT_DEVICE := vince
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Redmi 5 Plus
PRODUCT_NAME := lineage_vince
PRODUCT_SYSTEM_NAME := vince

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_VERSION_TAGS=release-keys \
    PRIVATE_BUILD_DESC="vince-user $(PLATFORM_VERSION) $(BUILD_ID) $(shell date -u +%s) release-keys" \
    TARGET_BUILD_FLAVOR=vince-user \
    TARGET_BUILD_TYPE=user \
    TARGET_PRODUCT=vince

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "xiaomi/vince/vince:$(PLATFORM_VERSION)/$(BUILD_ID)/$(shell date -u +%s):user/release-keys"
