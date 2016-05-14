# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/libra/aosp_libra.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_libra
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi-4c
TARGET_MANUFACTURER := Xiaomi
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=libra \
    BUILD_FINGERPRINT=Xiaomi/libra/libra:5.1.1/LMY47V/V7.3.1.0.LXKCNDD:user/release-keys \
    PRIVATE_BUILD_DESC="libra-user 5.1.1 LMY47V V7.3.1.0.LXKCNDD release-keys"
