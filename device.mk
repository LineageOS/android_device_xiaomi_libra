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

# This file includes all definitions that apply to ALL libra devices, and
# are also specific to libra devices
#
# Everything in this directory will become public

PRODUCT_COPY_FILES += \
    device/xiaomi/libra/init.libra.rc:root/init.libra.rc \
    device/xiaomi/libra/init.aqua.rc:root/init.aqua.rc \
    device/xiaomi/libra/init.recovery.libra.rc:root/init.recovery.libra.rc \
    device/xiaomi/libra/init.libra.usb.rc:root/init.libra.usb.rc \
    device/xiaomi/libra/fstab.libra:root/fstab.libra \
    device/xiaomi/libra/ueventd.libra.rc:root/ueventd.libra.rc \
    device/xiaomi/libra/init.libra.ramdump.rc:root/init.libra.ramdump.rc

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/xiaomi/libra/media_codecs.xml:system/etc/media_codecs.xml \
    device/xiaomi/libra/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    device/xiaomi/libra/media_profiles.xml:system/etc/media_profiles.xml

# Audio
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/xiaomi/libra/audio/audio_output_policy.conf:system/etc/audio_output_policy.conf \
    device/xiaomi/libra/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/xiaomi/libra/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/xiaomi/libra/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    device/xiaomi/libra/audio/surround_sound_rec_AZ.cfg:system/etc/surround_sound_3mic/surround_sound_rec_AZ.cfg \
    device/xiaomi/libra/audio/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt

#Sound Trigger
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/xiaomi/libra/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml

# Input device files
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/keylayout/atmel-maxtouch.kl:system/usr/keylayout/atmel-maxtouch.kl \
    device/xiaomi/libra/keylayout/atmel-maxtouch-edge.kl:system/usr/keylayout/atmel-maxtouch-edge.kl \
    device/xiaomi/libra/keylayout/ft5x46.kl:system/usr/keylayout/ft5x46.kl \
    device/xiaomi/libra/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/xiaomi/libra/keylayout/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl \
    device/xiaomi/libra/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    device/xiaomi/libra/keylayout/synaptics_dsx_edge.kl:system/usr/keylayout/synaptics_dsx_edge.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

# For SPN display
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/spn-conf.xml:system/etc/spn-conf.xml

# For GPS
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/sec_config:system/etc/sec_config

# For WiFi
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/xiaomi/libra/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/xiaomi/libra/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/xiaomi/libra/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/xiaomi/libra/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/qca_cld/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
    device/xiaomi/libra/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    device/xiaomi/libra/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    device/xiaomi/libra/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny

# Thermal engine
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/thermal-engine-8992.conf:system/etc/thermal-engine-8992.conf

# MSM IRQ balance
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/msm_irqbalance.conf:system/etc/msm_irqbalance.conf

# Power configuration file
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/init.libra.power.sh:system/bin/init.libra.power.sh

# MBN
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/init.libra.sh:system/bin/init.libra.sh

# Fingerprint disabler
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/fingerprint.sh:system/bin/fingerprint.sh

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# for off charging mode
WITH_CM_CHARGER := false

PRODUCT_PACKAGES += \
    charger_res_images \
    libhealthd.qcom

# aqua boot helper
PRODUCT_PACKAGES += \
    aqua

PRODUCT_PACKAGES += \
    copybit.msm8992 \
    gralloc.msm8992 \
    hwcomposer.msm8992 \
    memtrack.msm8992 \
    lights.libra

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc

# Audio HAL and utilities
PRODUCT_PACKAGES += \
    audio.primary.msm8992 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio_policy.msm8992

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcomvisualizer \
    libqcompostprocbundle

PRODUCT_PACKAGES += \
    librmnetctl \
    rmnetcli \
    libxml2

# GPS configuration
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/gps.conf:system/etc/gps.conf

# Fingerprint Sensor
PRODUCT_PACKAGES += \
    fingerprint.libra \
    fingerprintd

# Wi-Fi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    xiaomi_hwaddrs

# Camera
PRODUCT_PACKAGES += \
    camera.msm8992 \
    libcamera \
    libmmcamera_interface \
    libmmcamera_interface2 \
    libmmjpeg_interface \
    libqomx_core \
    mm-qcamera-app \
    Snap

# Snap Config
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.cpp.duplication=false

# Sensor & activity_recognition HAL
PRODUCT_PACKAGES += \
    sensors.msm8992 \
    activity_recognition.libra

# Multi HAL configuration file
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/hals.conf:system/etc/sensors/hals.conf

# Build stlport for legacy blobs
PRODUCT_PACKAGES += \
    libstlport

# Legacy blob symbols
PRODUCT_PACKAGES += \
    libshim_camera

PRODUCT_PACKAGES += \
    keystore.msm8992 \
    gatekeeper.msm8992

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
   fs_config_files

# ANT+
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio \
    libbt-vendor

DEVICE_PACKAGE_OVERLAYS := \
    device/xiaomi/libra/overlay

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    persist.audio.ssr.3mic=false \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    persist.speaker.prot.enable=false \
    ro.config.vc_call_vol_steps=7 \
    audio.offload.pcm.24bit.enable=true \
    audio.offload.pcm.16bit.enable=false \
    audio.offload.gapless.enabled=true \
    audio.offload.buffer.size.kb=32 \
    audio.offload.video=true \
    audio.offload.multiple.enabled=false \
    av.streaming.offload.enable=true \
    audio.deep_buffer.media=true \
    use.voice.path.for.pcm.voip=true

# Stereo camcorder
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.camcorder.stereo=true

# Custom acdb name
PRODUCT_PROPERTY_OVERRIDES += \
    audio.acdb.name=Forte

# Reduce client buffer size for fast audio output tracks
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1

# Low latency audio buffer size in frames
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.period_size=192

# Enable dirac effect for speaker
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.dirac.speaker=true

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420

PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.egl.hw=1 \
    debug.sf.hw=1 \
    persist.metadata_dynfps.disable=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.enable.sglscale=1 \
    debug.mdpcomp.idletime=600 \
    debug.mdpcomp.logs=0 \
    persist.debug.wfd.enable=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    persist.hwc.mdpcomp.maxpermixer=5 \
    persist.hwc.ptor.enable=true \
    persist.mdpcomp.4k2kSplit=1 \
    persist.mdpcomp_perfhint=50 \
    persist.sys.wfd.virtual=0 \
    ro.qualcomm.cabl=0

# Enable low power video mode for 4K encode
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.debug.level=1 \
    vidc.enc.dcvs.extra-buff-count=2

# Enable smooth streaming
PRODUCT_PROPERTY_OVERRIDES += \
    mm.enable.smoothstreaming=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=56 \
    ro.hwui.layer_cache_size=32 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.path_cache_size=16 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# for perfd
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq \
    ro.min_freq_0=384000 \
    ro.min_freq_4=384000

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_cdma_sub=0 \
    persist.qcril.disable_retry=true

# LTE, CDMA, GSM/WCDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=22 \
    telephony.lteOnCdmaDevice=1 \
    persist.radio.mode_pref_nv10=1

# Multi SIM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds

# RIL subscription types
PRODUCT_PROPERTY_OVERRIDES += \
    ril.subscription.types=RUIM

# Enable manual network selection function and distinguish 2G/3G/4G
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.rat_on=combine

# Emergency call overrides for Korea
PRODUCT_PROPERTY_OVERRIDES += \
    ril.nosim.ecc_list_count=1 \
    ril.nosim.ecc_list_1=111,113,117,122,125

# low audio flinger standby delay to reduce power consumption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.flinger_standbytime_ms=300

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# Setup custom emergency number list based on the MCC. This is needed by RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.custom_ecc=1

# IMS over WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.iwlan.enable=true

# Request modem to send PLMN name always irrespective
# of display condition in EFSPN.
# RIL uses this property.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.always_send_plmn=true

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=0

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.use_cc_names=true

# Update 1x signal strength after 10s
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.radio.snapshot_enabled=1 \
    persist.radio.snapshot_timer=10

# If data_no_toggle is 0 there are no reports if the screen is off.
# If data_no_toggle is 1 then dormancy indications will come with screen off.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.data_no_toggle=1

# Adjust STK popup operation
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.process_sups_ind=1

# VZW voice roaming issue
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.eri64_as_home=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.data_con_rprt=true

# Set bluetooth soc to rome
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=rome

# Set Bluetooth transport initialization timeout
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.enable_timeout_ms=12000

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/misc/bluetooth/bdaddr.txt

# Enable hands-free profile and set power class
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.hfp.client=1 \
    ro.bluetooth.hfp.ver=1.6 \
    qcom.bt.le_dev_pwr_class=1

# limit dex2oat threads to improve thermals
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.boot-dex2oat-threads=4 \
    dalvik.vm.dex2oat-threads=2 \
    dalvik.vm.image-dex2oat-threads=4

# Disable Camera TNR
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.tnr.preview=0 \
    persist.camera.tnr.video=0

# Incoming number (b/23529711)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.redir_party_num=0

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8992

# Modem debugger/misc
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += \
    QXDMLogger

PRODUCT_COPY_FILES += \
    device/xiaomi/libra/init.libra.diag.rc.userdebug:root/init.libra.diag.rc \
    device/xiaomi/libra/init.libra.misc.rc.userdebug:root/init.libra.misc.rc
else
PRODUCT_COPY_FILES += \
    device/xiaomi/libra/init.libra.diag.rc.user:root/init.libra.diag.rc \
    device/xiaomi/libra/init.libra.misc.rc.user:root/init.libra.misc.rc
endif

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/qcom/msm8994/msm8992.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8994/msm8994-gpu-vendor.mk)
