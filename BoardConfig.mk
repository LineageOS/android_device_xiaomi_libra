#
# Copyright (C) 2015 The Android Open-Source Project
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

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

ENABLE_CPUSETS := true

TARGET_NO_BOOTLOADER := true

# Inline kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DT := true
BOARD_DTBTOOL_ARGS := -2
TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8992
TARGET_KERNEL_CONFIG := blackhawk_libra_defconfig

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := true

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=libra boot_cpus=0-5
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 msm_poweroff.download_mode=0
#BOARD_KERNEL_CMDLINE += synaptics_dsx.startup_fw_update=1
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Kernel modules in rootfs
NEED_KERNEL_MODULE_ROOT := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_libra
TARGET_RECOVERY_DEVICE_MODULES := libinit_libra
TARGET_UNIFIED_DEVICE := true

TARGET_KEYMASTER_WAIT_FOR_QSEE := true

BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/libra/bluetooth
BOARD_HAS_QCA_BT_ROME := true
WCNSS_FILTER_USES_SIBS := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := false

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-uart"

# Time services
BOARD_USES_QC_TIME_SERVICES := true

BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_MODULE_PATH := "/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"

BOARD_USES_SECURE_SERVICES := true

#BOARD_HAS_FINGERPRINT_FPC := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8992
TARGET_BOOTLOADER_BOARD_NAME := libra
TARGET_BOARD_INFO_FILE := device/xiaomi/libra/board-info.txt
TARGET_NO_RPC := true

BOARD_EGL_CFG := device/xiaomi/libra/egl.cfg

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048

# Remove opaque check in preparing dirty region
COMMON_GLOBAL_CFLAGS += -DHWUI_OPENGL_QUIRK

HAVE_ADRENO_SOURCE:= false

OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_RILD := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2013265920
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27980184576
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.libra

TARGET_RECOVERY_FSTAB = device/xiaomi/libra/fstab.libra

TARGET_RELEASETOOLS_EXTENSIONS := device/xiaomi/libra

BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_HAL_STATIC_LIBRARIES += libhealthd.qcom

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/xiaomi/libra/sepolicy

TARGET_USES_64_BIT_BINDER := true

TARGET_USES_AOSP := true
TARGET_USES_INTERACTION_BOOST := true

# Force camera module to be compiled only in 32-bit mode on 64-bit systems
# Once camera module can run in the native mode of the system (either
# 32-bit or 64-bit), the following line should be deleted
BOARD_QTI_CAMERA_32BIT_ONLY := true
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT

#Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Double tap to wake
TARGET_TAP_TO_WAKE_NODE := "/proc/touchscreen/double_tap_enable"

# CM Hardware
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += device/xiaomi/libra/cmhw

# Disable Jack & Jill compilation
ANDROID_COMPILE_WITH_JACK := false

-include vendor/xiaomi/libra/BoardConfigVendor.mk
